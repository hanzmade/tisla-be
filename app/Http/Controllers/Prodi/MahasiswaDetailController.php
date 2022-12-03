<?php

namespace App\Http\Controllers\Prodi;

use Illuminate\Http\Request;
use App\Models\MMahasiswa;

class MahasiswaDetailController extends Controller
{
    public function index(Request $request)
    {
        $getMhs = MMahasiswa::selectRaw('m_mahasiswa.name, m_mahasiswa.nim, m_program_studies.name as prodi')
                            ->join('a_mahasiswa_program_studies', 'm_mahasiswa.nim', '=', 'a_mahasiswa_program_studies.m_mahasiswa_nim')
                            ->join('m_program_studies', 'a_mahasiswa_program_studies.m_program_study_id', '=', 'm_program_studies.id')
                            ->where('nim', 'LIKE', '%'.$request->nim.'%')
                            ->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data !',
            'data' => [
                'name' => explode('(', $getMhs['name'])[0],
                'nim' => $getMhs['nim'],
                'prodi' => $getMhs['prodi'],
                'fakultas' => 'Teknik'
            ]
        ]);
    }
}
