<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AMataKuliah;

class MataKuliahDetailController extends Controller
{
    public function index(Request $request)
    {
        $getDetail = AMataKuliah::selectRaw('a_mata_kuliah.id, m_cpmk.name as cpmkname, m_cpl.name as cplname, 
                                            m_competencies.name as competenciesname, a_mata_kuliah.created_at, 
                                            a_mata_kuliah.deleted_at')
                                ->join('a_mata_kuliah_cpl', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_cpl.a_mata_kuliah_id')
                                ->join('a_mata_kuliah_cpmk', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_cpmk.a_mata_kuliah_id')
                                ->join('a_mata_kuliah_competencies', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_competencies.a_mata_kuliah_id')
                                ->join('m_competencies', 'a_mata_kuliah_competencies.competencies_id', '=', 'm_competencies.id')
                                ->join('m_cpmk', 'a_mata_kuliah_cpmk.cpmk_id', '=', 'm_cpmk.id')
                                ->join('m_cpl', 'a_mata_kuliah_cpl.cpl_id', '=', 'm_cpl.id')
                                ->where('a_mata_kuliah.id', $request->id)
                                ->orderBy('m_competencies.id', 'ASC')
                                ->get();

        return response()->json([
            'success' => true,
            'data' => $getDetail
        ]);

    }
}
