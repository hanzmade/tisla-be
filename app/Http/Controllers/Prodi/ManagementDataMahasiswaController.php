<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MMahasiswa;
use App\Models\AMahasiswaProgramStudy;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;

class ManagementDataMahasiswaController extends Controller
{
    public function index(Request $request)
    {
        $getMahasiswa = null;
        $startYear = Carbon::now()->subYears(7)->format('Y');
        $endYear = Carbon::now()->format('Y');

        if ($request->search) {
            $getMahasiswa = AUserProgramStudy::selectRaw('m_mahasiswa.*')
                                            ->join('a_mahasiswa_program_studies', 'a_user_program_studies.program_study_id', '=', 'a_mahasiswa_program_studies.m_program_study_id')
                                            ->join('m_mahasiswa', 'a_mahasiswa_program_studies.m_mahasiswa_nim', '=', 'm_mahasiswa.nim')
                                            ->where('a_user_program_studies.user_id', auth()->user()->id)
                                            ->where('m_mahasiswa.deleted_at', null)
                                            ->where('m_mahasiswa.name', 'LIKE', '%'.strtoupper($request->search).'%')
                                            ->where('m_mahasiswa.year_of_entry', '>=', $startYear)
                                            ->where('m_mahasiswa.year_of_entry', '<=', $endYear)
                                            ->orderBy('m_mahasiswa.id', 'DESC')
                                            ->groupBy('m_mahasiswa.id')
                                            ->paginate(10);
        }else{
            $getMahasiswa = AUserProgramStudy::selectRaw('m_mahasiswa.*')
                                            ->join('a_mahasiswa_program_studies', 'a_user_program_studies.program_study_id', '=', 'a_mahasiswa_program_studies.m_program_study_id')
                                            ->join('m_mahasiswa', 'a_mahasiswa_program_studies.m_mahasiswa_nim', '=', 'm_mahasiswa.nim')
                                            ->where('a_user_program_studies.user_id', auth()->user()->id)
                                            ->where('m_mahasiswa.deleted_at', null)
                                            ->where('m_mahasiswa.year_of_entry', '>=', $startYear)
                                            ->where('m_mahasiswa.year_of_entry', '<=', $endYear)
                                            ->orderBy('m_mahasiswa.id', 'DESC')
                                            ->groupBy('m_mahasiswa.id')
                                            ->paginate(50);
        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data mahasiswa',
            'data' => $getMahasiswa
        ]);
    }

    public function insert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $insert = MMahasiswa::insert([
            'nim' => $request->nim,
            'name' => $request->name,
            'curriculum' => $request->curriculum,
            'graduate_of' => $request->graduate_of,
            'class' => $request->class,
            'college_status' => $request->college_status,
            'year_of_entry' => $request->year_of_entry,
            'tk' => $request->tk,
            'hk' => $request->hk,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);

        $insert2 = AMahasiswaProgramStudy::insert([
            'm_mahasiswa_nim' => $request->nim,
            'm_program_study_id' => $getProdi['program_study_id']
        ]);
        
        return response()->json([
            'success' => true,
            'message' => 'Berhasil memasukkan data mahasiswa'
        ]);
    }

    public function edit(Request $request)
    {
        $edit = MMahasiswa::where('nim', 'like', $request->nim.'%')
                            ->where('deleted_at', null)
                            ->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data mahasiswa',
            'data' => $edit
        ]);
    }

    public function update(Request $request)
    {
        $update = MMahasiswa::where('nim', 'like', $request->nim.'%')
                            ->update([
                                'name' => $request->name,
                                'curriculum' => $request->curriculum,
                                'graduate_of' => $request->graduate_of,
                                'class' => $request->class,
                                'college_status' => $request->college_status,
                                'year_of_entry' => $request->year_of_entry,
                                'tk' => $request->tk,
                                'hk' => $request->hk,
                                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                            ]);

        return response()->json([
            'success' => true,
            'message' => 'Berasil update data mahasiswa'
        ]);
    }

    public function destroy(Request $request)
    {
        $delete = MMahasiswa::where('nim', 'like', $request->nim.'%')
                            ->update([
                                'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                            ]);

        return response()->json([
            'success' => true,
            'message' => 'Berasil menghapus data mahasiswa'
        ]);
    }
}
