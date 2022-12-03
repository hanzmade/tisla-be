<?php

namespace App\Http\Controllers\Prodi;

use Illuminate\Http\Request;
use App\Models\UserRole;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\Prodi\ProdiImportMatkul;
use App\Models\SyncronizeFile;
use App\Models\MMataKuliah;
use App\Models\AMataKuliah;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;
use DB;

class MataKuliahController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getMataKuliah = null;
        if ($request->search) {
            $getMataKuliah = AMataKuliah::selectRaw('m_mata_kuliah.*, a_mata_kuliah.id as idamatakuliah')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                        ->where('a_mata_kuliah.type', 'p')
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->where('m_mata_kuliah.name', 'LIKE', '%'.strtoupper($request->search).'%')
                                        ->take(1)
                                        ->get();
        }else{
            $getMataKuliah = AMataKuliah::selectRaw('m_mata_kuliah.*, a_mata_kuliah.id as idamatakuliah, m_dosen.name as dosenname,
                                                    a_mata_kuliah.m_class_code as kode_kelas')
                                        ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                        ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                        ->where('a_mata_kuliah.type', 'p')
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->get();
        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data mata kuliah',
            'data' => $getMataKuliah
        ]);
    }

    public function insert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $insertMatkul = MMataKuliah::insert([
            'name' => $request->name,
            'code' => $request->code,
            'status' => $request->status,
            'paket' => $request->paket,
            'rapem' => $request->rapem,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);

        $getLatestData = MMataKuliah::orderBy('id', 'DESC')->first();

        $insertAMataKuliah = AMataKuliah::insert([
            'master_id' => $getProdi['program_study_id'],
            'mata_kuliah_code' => $request->code,
            'type' => 'p',
            'm_class_code' => $request->kode_kelas,
            'm_curriculum_code' => $request->m_curriculum_code,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil memasukkan data mata kuliah'
        ]);
    }

    public function edit(Request $request)
    {
        $getMataKuliah = MMataKuliah::selectRaw('m_mata_kuliah.id, a_mata_kuliah.mata_kuliah_code as code, a_mata_kuliah.m_class_code as kode_kelas,
                                                a_mata_kuliah.semester, a_mata_kuliah.sks, a_mata_kuliah.m_curriculum_code as kurikulum,
                                                m_mata_kuliah.name, m_mata_kuliah.status, m_mata_kuliah.paket, m_mata_kuliah.rapem')
                                    ->join('a_mata_kuliah', 'm_mata_kuliah.code', '=', 'a_mata_kuliah.mata_kuliah_code')
                                    ->where('m_mata_kuliah.id', $request->id)
                                    ->where('a_mata_kuliah.deleted_at', null)
                                    ->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data mata kuliah',
            'data' => $getMataKuliah
        ]);
    }

    public function update(Request $request)
    {
        $update = MMataKuliah::where('id',$request->id)
                            ->update([
                                'name' => $request->name,
                                'code' => $request->code,
                                'status' => $request->status,
                                'paket' => $request->paket,
                                'rapem' => $request->rapem,
                                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                            ]);

        $updateAMataKuliah = AMataKuliah::where('mata_kuliah_code', $request->code)
                                        ->update([
                                            'm_class_code' => $request->kode_kelas,
                                            'm_curriculum_code' => $request->m_curriculum_code
                                        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil update data mata kuliah'
        ]);
    }

    public function destroy(Request $request){
        $delete = MMataKuliah::where('id', $request->id)
                            ->update([
                                'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                            ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil menghapus data mata kuliah'
        ]);
    }

    public function uploadFile(Request $request)
    {
        // $validatedData = $request->validate([
        //     'file' => 'required|csv,xlx,xls,xlsm|max:2048',
        // ]);

        $fileName = time().'.'.$request->file->extension();  
        $request->file->move(public_path('storage/files/prodi/mata-kuliah'), $fileName);

        $insert = SyncronizeFile::insert([
            'user_id' => auth()->user()->id,
            'path' => public_path('storage/files/prodi/mata-kuliah/') . $fileName,
            'filename' => $fileName,
            'type' => 'mata-kuliah',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil upload file !',
            'path' => public_path('storage/files/prodi/mata-kuliah/') . $fileName,
            'filename' => $fileName
        ]);
    }

    public function render(Request $request)
    {
        // Excel::import(new AdminImports, request()->file('file'));

        try {
            Excel::import(new ProdiImportMatkul, public_path('storage/files/prodi/mata-kuliah/') . $request->filename);
            
            return response()->json([
                'success' => true,
                'message' => 'Berhasil render.'
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal render ! Silakan coba lagi. ' . $th
            ]);
        }

    }

    public function versionControlFile()
    {
        $getList = SyncronizeFile::selectRaw('id, user_id, path, filename, created_at')
                                ->where('user_id', auth()->user()->id)
                                ->where('type', 'mata-kuliah')
                                ->orderBy('id','DESC')
                                ->get();
        
        if (count($getList) > 0) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil mendapatkan data.',
                'data' => $getList
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan.'
            ]);
        }
    }
}
