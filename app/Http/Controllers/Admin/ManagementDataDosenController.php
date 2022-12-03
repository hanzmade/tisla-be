<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MDosen;

class ManagementDataDosenController extends Controller
{
    public function index(Request $request)
    {
        $getDosen = null;

        if ($request->search) {
            $getDosen = MDosen::selectRaw('m_dosen.*')
                                            ->where('m_dosen.deleted_at', null)
                                            ->where('m_dosen.name', 'LIKE', '%'.$request->search.'%')
                                            ->orderBy('m_dosen.id', 'DESC')
                                            ->take(1000)
                                            ->get();
        }else{
            $getDosen = MDosen::selectRaw('m_dosen.*')
                                            ->where('m_dosen.deleted_at', null)
                                            ->orderBy('m_dosen.id', 'DESC')
                                            ->take(1000)
                                            ->get();

        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data dosen',
            'data' => $getDosen
        ]);
    }
}
