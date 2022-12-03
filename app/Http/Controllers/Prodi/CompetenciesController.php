<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MCpl;
use App\Models\MCompetency;
use App\Models\ACplCompetency;
use App\Models\AMataKuliahCpl;
use App\Models\AMataKuliah;
use App\Models\AMataKuliahCompetency;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;

class CompetenciesController extends Controller
{
    public function index()
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCpl = MCpl::selectRaw('m_cpl.code as cplCode, m_cpl.name as cplName, m_mata_kuliah.id as matkulId, 
                                    m_mata_kuliah.name as matkulName, a_mata_kuliah_cpl.id as matkulCplId,
                                    m_competencies.id as competenciesid, m_competencies.name as competenciesname')
                            ->join('a_mata_kuliah_cpl', 'm_cpl.id', '=', 'a_mata_kuliah_cpl.cpl_id')
                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                            ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                            ->join('a_cpl_competencies', 'a_mata_kuliah_cpl.id', '=', 'a_cpl_competencies.a_mata_kuliah_cpl_id')
                            ->join('a_mata_kuliah_competencies', 'a_cpl_competencies.a_mata_kuliah_competencies_id', '=', 'a_mata_kuliah_competencies.id')
                            ->join('m_competencies', 'a_mata_kuliah_competencies.competencies_id', '=', 'm_competencies.id')
                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                            ->where('m_cpl.deleted_at', null)
                            ->where('a_mata_kuliah_cpl.deleted_at', null)
                            ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data competencies',
            'data' => $getCpl
        ]);

    }

    public function preInsert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getAMataKuliah = AMataKuliah::selectRaw('a_mata_kuliah.id as matkulid, m_mata_kuliah.name as matkulname')
                                ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                ->get();

        $getCpl = AMataKuliah::selectRaw('a_mata_kuliah_cpl.id as amatkulcplid, m_cpl.name as cplname')
                                ->leftJoin('a_mata_kuliah_cpl', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_cpl.a_mata_kuliah_id')
                                ->leftJoin('m_cpl', 'a_mata_kuliah_cpl.cpl_id', '=', 'm_cpl.id')
                                ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                ->get();

        $getCompetencies = AMataKuliah::selectRaw('a_mata_kuliah_competencies.id as amatkulcompetenciesid, m_competencies.name as competenciesname')
                                    ->leftJoin('a_mata_kuliah_cpl', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_cpl.a_mata_kuliah_id')
                                    ->leftJoin('m_cpl', 'a_mata_kuliah_cpl.cpl_id', '=', 'm_cpl.id')
                                    ->join('a_cpl_competencies', 'a_mata_kuliah_cpl.id', '=', 'a_cpl_competencies.a_mata_kuliah_cpl_id')
                                    ->join('a_mata_kuliah_competencies', 'a_cpl_competencies.a_mata_kuliah_competencies_id', '=', 'a_mata_kuliah_competencies.id')
                                    ->join('m_competencies', 'a_mata_kuliah_competencies.competencies_id', '=', 'm_competencies.id')
                                    ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                    ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data', 
            'matkul' => $getAMataKuliah,
            'cpl' => $getCpl,
            'competencies' => $getCompetencies
        ]);
    }

    public function insert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCompetencies = MCompetency::where('name', 'LIKE', '%'.$request->competenciesName.'%')->first();
        
        if ($getCompetencies == null) {
            MCompetency::insert([
                'name' => $request->competenciesName,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);

            $getCompetencies = MCompetency::where('name', 'LIKE', '%'.$request->competenciesName.'%')->first();

        }
        
        $checkAMataKuliahCompetencies = AMataKuliahCompetency::selectRaw('a_mata_kuliah_competencies.*')
                                            ->join('a_mata_kuliah', 'a_mata_kuliah_competencies.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                            ->where('a_mata_kuliah.id', $request->matkulId)
                                            ->where('a_mata_kuliah_competencies.competencies_id', $getCompetencies['id'])
                                            ->first();
                                            
        if ($checkAMataKuliahCompetencies == null) {
            AMataKuliahCompetency::insert([
                'a_mata_kuliah_id' => $request->matkulId,
                'competencies_id' => $getCompetencies['id'],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
            
            $checkAMataKuliahCompetencies = AMataKuliahCompetency::selectRaw('a_mata_kuliah_competencies.*')
                                                                ->join('a_mata_kuliah', 'a_mata_kuliah_competencies.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                                                ->where('a_mata_kuliah.id', $request->matkulId)
                                                                ->where('a_mata_kuliah_competencies.competencies_id', $getCompetencies['id'])
                                                                ->first();
        }
        
        $checkACplCompetencies = ACplCompetency::where('a_mata_kuliah_cpl_id', $request->matkulCplId)
                                                ->where('a_mata_kuliah_competencies_id', $request->matkulCompetenciesId)
                                                ->first();

        if ($checkACplCompetencies == null) {
            ACplCompetency::insert([
                'a_mata_kuliah_cpl_id' => $request->matkulCplId,
                'a_mata_kuliah_competencies_id' => $checkAMataKuliahCompetencies['id'],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
             
            $checkACplCompetencies = ACplCompetency::where('a_mata_kuliah_cpl_id', $request->matkulCplId)
                                                    ->where('a_mata_kuliah_competencies_id', $checkAMataKuliahCompetencies['id'])
                                                    ->first();

        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil memasukkan data competencies'
        ]);
    
    }

    public function edit(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCpl = MCpl::selectRaw('m_cpl.code as cplCode, m_cpl.name as cplName, m_mata_kuliah.id as matkulId, a_cpl_competencies.id as cplCompetenciesId,
                                    m_mata_kuliah.name as matkulName, a_mata_kuliah_cpl.id as amatkulcplid, a_mata_kuliah_competencies.id as matkulCompetenciesId,
                                    m_competencies.id as competenciesid, m_competencies.name as competenciesname')
                        ->join('a_mata_kuliah_cpl', 'm_cpl.id', '=', 'a_mata_kuliah_cpl.cpl_id')
                        ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                        ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                        ->join('a_cpl_competencies', 'a_mata_kuliah_cpl.id', '=', 'a_cpl_competencies.a_mata_kuliah_cpl_id')
                        ->join('a_mata_kuliah_competencies', 'a_cpl_competencies.a_mata_kuliah_competencies_id', '=', 'a_mata_kuliah_competencies.id')
                        ->join('m_competencies', 'a_mata_kuliah_competencies.competencies_id', '=', 'm_competencies.id')
                        ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                        ->where('m_mata_kuliah.id', $request->matkulId)
                        ->where('m_competencies.id', $request->competenciesId)
                        ->where('m_cpl.deleted_at', null)
                        ->where('a_mata_kuliah_cpl.deleted_at', null)
                        ->where('a_mata_kuliah_competencies.deleted_at', null)
                        ->first();
        
        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data competencies',
            'data' => $getCpl
        ]);
    }

    public function update(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCompetencies = MCompetency::where('name', 'LIKE', '%'.$request->competenciesName.'%')
                                        ->update([
                                            'name' => $request->competenciesName,
                                            'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                                        ]);

        $getCompetencies = MCompetency::where('name', 'LIKE', '%'.$request->competenciesName.'%')->first();
        
        $checkAMataKuliahCompetencies = AMataKuliahCompetency::where('a_mata_kuliah_competencies.id', $request->matkulCompetenciesId)
                                                            ->update([
                                                                'a_mata_kuliah_id' => $request->matkulId,
                                                                'competencies_id' => $getCompetencies['id'],
                                                                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                                                            ]);
            
        $checkAMataKuliahCompetencies = AMataKuliahCompetency::selectRaw('a_mata_kuliah_competencies.*')
                                                            ->join('a_mata_kuliah', 'a_mata_kuliah_competencies.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                                            ->where('a_mata_kuliah.id', $request->matkulId)
                                                            ->where('a_mata_kuliah_competencies.competencies_id', $getCompetencies['id'])
                                                            ->first();
        
        
        $checkACplCompetencies = ACplCompetency::where('id', $request->cplCompetenciesId)
                                                ->update([
                                                    'a_mata_kuliah_cpl_id' => $request->matkulCplId,
                                                    'a_mata_kuliah_competencies_id' => $checkAMataKuliahCompetencies['id'],
                                                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                                                ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil update data competencies'
        ]);
    }

    public function destroy(Request $request)
    {
        $update = AMataKuliahCompetency::where('id', $request->matkulCompetenciesId)
                                ->update([
                                    'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil menghapus data competencies'
        ]);
    }
}
