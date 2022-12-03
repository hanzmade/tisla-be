<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MProgramStudy;
use App\Models\User;
use App\Models\UserRole;
use App\Models\ACplCompetency;
use App\Models\AUserProgramStudy;
use App\Models\AMataKuliah;
use App\Models\MCpmk;
use App\Models\MCpl;
use App\Models\MCompetency;
use App\Models\MMataKuliah;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index()
    {
        try {
            $totalProdi = MProgramStudy::selectRaw('COUNT(*) as total')->where('deleted_at', null)->first();
            $totalUser = UserRole::selectRaw('COUNT(*) as total')
                                    ->whereNot('role_id', 4)->where('deleted_at', null)
                                    ->first();
            $totalCPMK = MCpmk::selectRaw('COUNT(*) as total')
                                ->join('a_mata_kuliah_cpmk', 'm_cpmk.id', '=', 'a_mata_kuliah_cpmk.cpmk_id')
                                ->join('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->first();

            $totalCPL = MCpl::selectRaw('COUNT(*) as total')
                                ->join('a_mata_kuliah_cpl', 'm_cpl.id', '=', 'a_mata_kuliah_cpl.cpl_id')
                                ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->first();

            $totalCompetency = MCompetency::selectRaw('COUNT(*) as total')
                                            ->join('a_mata_kuliah_competencies', 'm_competencies.id', '=', 'a_mata_kuliah_competencies.competencies_id')
                                            ->join('a_mata_kuliah', 'a_mata_kuliah_competencies.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                            ->where('a_mata_kuliah.deleted_at', null)
                                            ->first();

            $getProdiId = AUserProgramStudy::where('user_id', auth()->user()->id)->first();
            $CPLKompetensi = MProgramStudy::selectRaw('m_program_studies.id, m_program_studies.name')
                                    ->leftJoin('a_mata_kuliah','m_program_studies.id','=','a_mata_kuliah.master_id')
                                    ->groupBy('m_program_studies.id')
                                    ->get();

            $CPLKompetensiArr = $CPLKompetensi->toArray();

            foreach ($CPLKompetensiArr as $key => $value) {
                $totalCPMKDetail = MCpmk::selectRaw('COUNT(*) as total')
                                ->join('a_mata_kuliah_cpmk', 'm_cpmk.id', '=', 'a_mata_kuliah_cpmk.cpmk_id')
                                ->join('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->where('a_mata_kuliah.master_id', $value['id'])
                                ->first();

                $totalCPLDetail = MCpl::selectRaw('COUNT(*) as total')
                                ->join('a_mata_kuliah_cpl', 'm_cpl.id', '=', 'a_mata_kuliah_cpl.cpl_id')
                                ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->where('a_mata_kuliah.master_id', $value['id'])
                                ->first();

                $totalCompetencyDetail = MCompetency::selectRaw('COUNT(*) as total')
                                                ->join('a_mata_kuliah_competencies', 'm_competencies.id', '=', 'a_mata_kuliah_competencies.competencies_id')
                                                ->join('a_mata_kuliah', 'a_mata_kuliah_competencies.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                                ->where('a_mata_kuliah.deleted_at', null)
                                                ->where('a_mata_kuliah.master_id', $value['id'])
                                                ->first();

                $CPLKompetensiArr[$key]['totalcpmk'] = $totalCPMKDetail['total'];
                $CPLKompetensiArr[$key]['totalcpl'] = $totalCPLDetail['total'];
                $CPLKompetensiArr[$key]['totalcompetency'] = $totalCompetencyDetail['total'];
            }

            return response()->json([
                'success' => true,
                'message' => 'Berhasil mendapatkan data Home',
                'totalProdi' => $totalProdi['total'],
                'totalUser' => $totalUser['total'],
                'totalCPMK' => $totalCPMK['total'],
                'totalCPL' => $totalCPL['total'],
                'totalCompetency' => $totalCompetency['total'],
                'data' => $CPLKompetensiArr
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal mendapatkan Data, '.$th,
                'totalProdi' => null,
                'totalUser' => null,
                'totalCplCompetency' => []
            ]);
        }
        
    }

    public function detailProgramStudy(Request $request)
    {
        $CPLKompetensi = AMataKuliah::selectRaw('m_mata_kuliah.id, m_mata_kuliah.code, m_mata_kuliah.name, a_mata_kuliah.id as a_matkul_id')
                                ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                ->where('a_mata_kuliah.master_id', $request->idProdi)
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->groupBy('m_mata_kuliah.id', 'a_mata_kuliah.id')
                                ->get();

        $CPLKompetensiArr = $CPLKompetensi->toArray();

        foreach ($CPLKompetensiArr as $key => $value) {
            $totalCPMKDetail = MCpmk::selectRaw('COUNT(*) as total')
                            ->join('a_mata_kuliah_cpmk', 'm_cpmk.id', '=', 'a_mata_kuliah_cpmk.cpmk_id')
                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                            ->where('a_mata_kuliah.deleted_at', null)
                            ->where('a_mata_kuliah.id', $value['a_matkul_id'])
                            ->first();

            $totalCPLDetail = MCpl::selectRaw('COUNT(*) as total')
                            ->join('a_mata_kuliah_cpl', 'm_cpl.id', '=', 'a_mata_kuliah_cpl.cpl_id')
                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                            ->where('a_mata_kuliah.deleted_at', null)
                            ->where('a_mata_kuliah.id', $value['a_matkul_id'])
                            ->first();

            $totalCompetencyDetail = MCompetency::selectRaw('COUNT(*) as total')
                                            ->join('a_mata_kuliah_competencies', 'm_competencies.id', '=', 'a_mata_kuliah_competencies.competencies_id')
                                            ->join('a_mata_kuliah', 'a_mata_kuliah_competencies.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                            ->where('a_mata_kuliah.deleted_at', null)
                                            ->where('a_mata_kuliah.id', $value['a_matkul_id'])
                                            ->first();

            $CPLKompetensiArr[$key]['totalcpmk'] = $totalCPMKDetail['total'];
            $CPLKompetensiArr[$key]['totalcpl'] = $totalCPLDetail['total'];
            $CPLKompetensiArr[$key]['totalcompetency'] = $totalCompetencyDetail['total'];
        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data Detail Program Study',
            'data' => $CPLKompetensiArr
        ]);
    }

    public function detailMataKuliah(Request $request)
    {
        $mataKuliah = MMataKuliah::selectRaw('m_mata_kuliah.name')->where('id', $request->idMataKuliah)->first();

        $datas = AMataKuliah::selectRaw('m_cpmk.name as cpmkName, m_cpl.name as cplName, m_competencies.name as competenciesName')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->join('a_mata_kuliah_cpmk','a_mata_kuliah.id','=','a_mata_kuliah_cpmk.a_mata_kuliah_id')
                                        ->join('a_mata_kuliah_cpl','a_mata_kuliah.id','=','a_mata_kuliah_cpl.a_mata_kuliah_id')
                                        ->join('a_mata_kuliah_competencies','a_mata_kuliah.id','=','a_mata_kuliah_competencies.a_mata_kuliah_id')
                                        ->join('m_cpmk','a_mata_kuliah_cpmk.cpmk_id','=','m_cpmk.id')
                                        ->join('m_cpl','a_mata_kuliah_cpl.cpl_id','=','m_cpl.id')
                                        ->join('m_competencies','a_mata_kuliah_competencies.competencies_id','=','m_competencies.id')
                                        ->where('a_mata_kuliah.master_id', $request->idProdi)
                                        ->where('m_mata_kuliah.id', $request->idMataKuliah)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->orderBy('m_cpmk.id', 'ASC')
                                        ->groupBy('m_cpmk.id', 'm_cpmk.name', 'm_cpl.name', 'm_competencies.name')
                                        ->get();
                                        // ->leftJoin('a_cpl_competencies','a_mata_kuliah_cpl.id','=','a_cpl_competencies.a_cpmk_cpl_id')
                                        // ->leftJoin('m_competencies','a_cpl_competencies.competencies_id','=','m_competencies.id')

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data Detail Program Study',
            'mataKuliah' => $mataKuliah['name'],
            'datas' => $datas
            // 'cpmk' => $cpmk,
            // 'cpl' => $cpl,
            // 'competencies' => $competencies
        ]);
    }
}
