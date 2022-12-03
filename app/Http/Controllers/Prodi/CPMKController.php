<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MCpmk;
use App\Models\AMataKuliahCpmk;
use App\Models\AMataKuliah;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;

class CPMKController extends Controller
{
    public function index()
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCpl = MCpmk::selectRaw('m_cpmk.id as cpmkid, m_cpmk.name as cpmkName, m_mata_kuliah.id as matkulId, m_mata_kuliah.name as matkulName, a_mata_kuliah_cpmk.id as amatkulcpmkid')
                            ->join('a_mata_kuliah_cpmk', 'm_cpmk.id', '=', 'a_mata_kuliah_cpmk.cpmk_id')
                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                            ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                            ->where('m_cpmk.deleted_at', null)
                            ->where('a_mata_kuliah_cpmk.deleted_at', null)
                            ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data cpmk',
            'data' => $getCpl
        ]);

    }

    public function preInsert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getMatkul = AMataKuliah::selectRaw('a_mata_kuliah.id as matkulId, m_mata_kuliah.name')
                                ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                ->where('master_id', $getProdi['program_study_id'])
                                ->get();

        $getCpmk = AMataKuliah::selectRaw('m_cpmk.id as cpmkid, m_cpmk.name')
                            ->join('a_mata_kuliah_cpmk', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_cpmk.a_mata_kuliah_id')
                            ->join('m_cpmk', 'a_mata_kuliah_cpmk.cpmk_id', '=', 'm_cpmk.id')
                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                            ->groupBy('m_cpmk.id')
                            ->orderBy('m_cpmk.id')
                            ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data', 
            'matkul' => $getMatkul,
            'cpmk' => $getCpmk
        ]);
    }

    public function insert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $checkCpmk = MCpmk::where('name', 'LIKE', '%'.$request->cpmkName.'%')->first();

        if ($checkCpmk == null) {
            MCpmk::insert([
                'name' => $request->cpmkName,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
            
            $checkCpmk = MCpmk::where('name', 'LIKE', '%'.$request->cpmkName.'%')->first();

        }

        $checkAMataKuliahCpmk = AMataKuliahCpmk::selectRaw('a_mata_kuliah_cpmk.*')
                                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                            ->where('a_mata_kuliah_cpmk.cpmk_id', $checkCpmk['id'])
                                            ->first();
        // dd($checkCpmk);
        if ($checkAMataKuliahCpmk == null) {
            $getMatkul = 
            $insert = AMataKuliahCpmk::insert([
                'a_mata_kuliah_id' => $request->matkulId,
                'cpmk_id' => $checkCpmk['id'],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Berhasil memasukkan data cpmk'
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Tidak dapat menambahkan data !  Data sudah ada di system.'
            ]);
        }

    }

    public function edit(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCpl = MCpmk::selectRaw('m_cpmk.id as cpmkid, m_cpmk.name as cpmkName, m_mata_kuliah.id as matkulId, 
                                    m_mata_kuliah.name as matkulName, a_mata_kuliah_cpmk.id as amatkulcpmkid, 
                                    a_mata_kuliah_cpmk.deleted_at')
                            ->leftJoin('a_mata_kuliah_cpmk', 'm_cpmk.id', '=', 'a_mata_kuliah_cpmk.cpmk_id')
                            ->leftJoin('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                            ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                            ->where('m_cpmk.id', $request->cpmkId)
                            ->where('m_mata_kuliah.id', $request->matkulId)
                            ->where('m_cpmk.deleted_at', null)
                            ->where('a_mata_kuliah_cpmk.deleted_at', null)
                            ->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data cpmk',
            'data' => $getCpl
        ]);
    }

    public function update(Request $request)
    {

        $update = MCpmk::where('id', $request->cpmkId)
                                ->update([
                                    'name' => $request->cpmkName,
                                    'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);

        $checkMCpmk = MCpmk::where('id', $request->cpmkId)->first();

        $update2 = AMataKuliahCpmk::where('id', $request->aMatkulCpmkId)
                                ->update([
                                    'cpmk_id' => $checkMCpmk['id']
                                ]);
        // dd($update);
        return response()->json([
            'success' => true,
            'message' => 'Berhasil mengubah data cpmk'
        ]);
    }

    public function destroy(Request $request)
    {
        $update = AMataKuliahCpmk::where('id', $request->aMatkulCpmkId)
                                ->update([
                                    'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil menghapus data cpmk'
        ]);
    }
}
