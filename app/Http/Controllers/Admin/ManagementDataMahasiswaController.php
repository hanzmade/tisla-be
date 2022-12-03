<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MMahasiswa;

class ManagementDataMahasiswaController extends Controller
{
    public function index(Request $request)
    {
        $getMahasiswa = null;
        if ($request->search) {
            $getMahasiswa = MMahasiswa::selectRaw('m_mahasiswa.*')
                                            ->where('m_mahasiswa.deleted_at', null)
                                            ->where('m_mahasiswa.name', 'LIKE', '%'.$request->search.'%')
                                            ->orderBy('m_mahasiswa.id', 'DESC')
                                            ->get();
        }else{
            $getMahasiswa = MMahasiswa::selectRaw('m_mahasiswa.*')
                                            ->where('m_mahasiswa.deleted_at', null)
                                            ->orderBy('m_mahasiswa.id', 'DESC')
                                            ->take(1000)
                                            ->get();
        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data mahasiswa',
            'data' => $getMahasiswa
        ]);
    }
}
