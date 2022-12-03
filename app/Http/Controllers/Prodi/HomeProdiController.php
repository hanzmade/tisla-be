<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MCpmk;
use App\Models\MCourseWork;
use App\Models\AMataKuliah;
use App\Models\MMataKuliah;
use App\Models\AMataKuliahCpmk;
use App\Models\AUserProgramStudy;
use App\Models\MScore;
use App\Models\ACwQuestionCpmk;
use App\Models\ACwQuestionMhs;
use App\Models\ACwQuestionCpl;
use App\Models\ACplCompetency;
use App\Models\AMataKuliahEvaluation;
use Carbon\Carbon;
use DB;

class HomeProdiController extends Controller
{
    public function index(Request $request)
    {
        if ($request->tahun) {
            $getUserProdi = AUserProgramStudy::selectRaw('m_program_studies.code, m_program_studies.id')
                                            ->join('m_program_studies', 'a_user_program_studies.program_study_id', '=', 'm_program_studies.id')
                                            ->where('a_user_program_studies.user_id', auth()->user()->id)
                                            ->first();

            $aMataKuliah = null;
            if ($request->id_mata_kuliah) {
                $getMatkulId = MMataKuliah::selectRaw('m_mata_kuliah.id')
                                            ->join('a_mata_kuliah', 'm_mata_kuliah.code', '=' ,'a_mata_kuliah.mata_kuliah_code')
                                            ->where('a_mata_kuliah.id', $request->id_mata_kuliah)
                                            ->first();
                $aMataKuliah = AMataKuliah::selectRaw('a_mata_kuliah.master_id as id, a_mata_kuliah.mata_kuliah_code as id_subject,
                                                    a_mata_kuliah.unique_code, m_mata_kuliah.name as subject, a_mata_kuliah.dosen_nidn as id_lecture,
                                                    m_dosen.name as lecturer_name, a_mata_kuliah.level as lecturer_level, a_mata_kuliah.sks as lecturer_sks,
                                                    a_mata_kuliah.year as semester_year, a_mata_kuliah.created_at as createdat')
                                        ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->where('a_mata_kuliah.master_id', $getUserProdi['id'])
                                        ->where('m_mata_kuliah.id', $getMatkulId->id)
                                        ->where('a_mata_kuliah.year', 'LIKE', '%'.$request->tahun.'%')
                                        ->whereNot('a_mata_kuliah.unique_code', null)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->orderBy('a_mata_kuliah.created_at', 'DESC')
                                        ->paginate(10);
            }else{
                $aMataKuliah = AMataKuliah::selectRaw('a_mata_kuliah.master_id as id, a_mata_kuliah.mata_kuliah_code as id_subject,
                                                    a_mata_kuliah.unique_code, m_mata_kuliah.name as subject, a_mata_kuliah.dosen_nidn as id_lecture,
                                                    m_dosen.name as lecturer_name, a_mata_kuliah.level as lecturer_level, a_mata_kuliah.sks as lecturer_sks,
                                                    a_mata_kuliah.year as semester_year, a_mata_kuliah.created_at as createdat')
                                        ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->where('a_mata_kuliah.master_id', $getUserProdi['id'])
                                        // ->where('a_mata_kuliah.mata_kuliah_code', 'LIKE', 'W'.$getUserProdi['code'].'%')
                                        ->where('a_mata_kuliah.year', 'LIKE', '%'.$request->tahun.'%')
                                        ->whereNot('a_mata_kuliah.unique_code', null)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->orderBy('a_mata_kuliah.created_at', 'DESC')
                                        ->paginate(10);

            }

            return response()->json($aMataKuliah);
        }else if($request->semester){
            $getUserProdi = AUserProgramStudy::selectRaw('m_program_studies.code, m_program_studies.id')
                                            ->join('m_program_studies', 'a_user_program_studies.program_study_id', '=', 'm_program_studies.id')
                                            ->where('a_user_program_studies.user_id', auth()->user()->id)
                                            ->first();

            $aMataKuliah = null;
            if ($request->id_mata_kuliah) {
                $getMatkulId = MMataKuliah::selectRaw('m_mata_kuliah.id')
                                            ->join('a_mata_kuliah', 'm_mata_kuliah.code', '=' ,'a_mata_kuliah.mata_kuliah_code')
                                            ->where('a_mata_kuliah.id', $request->id_mata_kuliah)
                                            ->first();

                $aMataKuliah = AMataKuliah::selectRaw('a_mata_kuliah.master_id as id, a_mata_kuliah.mata_kuliah_code as id_subject,
                                                    a_mata_kuliah.unique_code, m_mata_kuliah.name as subject, a_mata_kuliah.dosen_nidn as id_lecture,
                                                    m_dosen.name as lecturer_name, a_mata_kuliah.level as lecturer_level, a_mata_kuliah.sks as lecturer_sks,
                                                    a_mata_kuliah.year as semester_year, a_mata_kuliah.created_at as createdat')
                                        ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->where('a_mata_kuliah.master_id', $getUserProdi['id'])
                                        ->where('m_mata_kuliah.id', $getMatkulId->id)
                                        ->whereIn('a_mata_kuliah.semester', ((strtolower($request->semester) == 'ganjil')? [1,3,5,7,9,11] : [2,4,6,8,10]))
                                        ->whereNot('a_mata_kuliah.unique_code', null)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->orderBy('a_mata_kuliah.created_at', 'DESC')
                                        ->paginate(10);
            }else{
                $aMataKuliah = AMataKuliah::selectRaw('a_mata_kuliah.master_id as id, a_mata_kuliah.mata_kuliah_code as id_subject,
                                                    a_mata_kuliah.unique_code, m_mata_kuliah.name as subject, a_mata_kuliah.dosen_nidn as id_lecture,
                                                    m_dosen.name as lecturer_name, a_mata_kuliah.level as lecturer_level, a_mata_kuliah.sks as lecturer_sks,
                                                    a_mata_kuliah.year as semester_year, a_mata_kuliah.created_at as createdat')
                                        ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->where('a_mata_kuliah.master_id', $getUserProdi['id'])
                                        // ->where('a_mata_kuliah.mata_kuliah_code', 'LIKE', 'W'.$getUserProdi['code'].'%')
                                        ->whereIn('a_mata_kuliah.semester', ((strtolower($request->semester) == 'ganjil')? [1,3,5,7,9,11] : [2,4,6,8,10]))
                                        ->whereNot('a_mata_kuliah.unique_code', null)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->orderBy('a_mata_kuliah.created_at', 'DESC')
                                        ->paginate(10);
            }
            return response()->json($aMataKuliah);
        }else{
            $getUserProdi = AUserProgramStudy::selectRaw('m_program_studies.code, m_program_studies.id')
                                            ->join('m_program_studies', 'a_user_program_studies.program_study_id', '=', 'm_program_studies.id')
                                            ->where('a_user_program_studies.user_id', auth()->user()->id)
                                            ->first();

            $aMataKuliah = null;
            if ($request->id_mata_kuliah) {
                $getMatkulId = MMataKuliah::selectRaw('m_mata_kuliah.id')
                                            ->join('a_mata_kuliah', 'm_mata_kuliah.code', '=' ,'a_mata_kuliah.mata_kuliah_code')
                                            ->where('a_mata_kuliah.id', $request->id_mata_kuliah)
                                            ->first();

                $aMataKuliah = AMataKuliah::selectRaw('a_mata_kuliah.master_id as id, a_mata_kuliah.mata_kuliah_code as id_subject,
                                                    a_mata_kuliah.unique_code, m_mata_kuliah.name as subject, a_mata_kuliah.dosen_nidn as id_lecture,
                                                    m_dosen.name as lecturer_name, a_mata_kuliah.level as lecturer_level, a_mata_kuliah.sks as lecturer_sks,
                                                    a_mata_kuliah.year as semester_year, a_mata_kuliah.created_at as createdat')
                                        ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->where('a_mata_kuliah.master_id', $getUserProdi['id'])
                                        ->where('m_mata_kuliah.id', $getMatkulId->id)
                                        ->whereNot('a_mata_kuliah.unique_code', null)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->orderBy('a_mata_kuliah.created_at', 'DESC')
                                        ->paginate(10);
            }else{
                $aMataKuliah = AMataKuliah::selectRaw('a_mata_kuliah.master_id as id, a_mata_kuliah.mata_kuliah_code as id_subject,
                                                    a_mata_kuliah.unique_code, m_mata_kuliah.name as subject, a_mata_kuliah.dosen_nidn as id_lecture,
                                                    m_dosen.name as lecturer_name, a_mata_kuliah.level as lecturer_level, a_mata_kuliah.sks as lecturer_sks,
                                                    a_mata_kuliah.year as semester_year, a_mata_kuliah.created_at as createdat')
                                        ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->where('a_mata_kuliah.master_id', $getUserProdi['id'])
                                        ->whereNot('a_mata_kuliah.unique_code', null)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->orderBy('a_mata_kuliah.created_at', 'DESC')
                                        ->paginate(10);
            }
            return response()->json($aMataKuliah);
        }
    }

    public function indexDetail(Request $request)
    {
        $getUserProdi = AUserProgramStudy::selectRaw('m_program_studies.name')
                                        ->join('m_program_studies', 'a_user_program_studies.program_study_id', '=', 'm_program_studies.id')
                                        ->where('a_user_program_studies.user_id', auth()->user()->id)
                                        ->first();

        $aMataKuliah = AMataKuliah::selectRaw('CASE
                                                WHEN a_mata_kuliah.m_class_code IS NULL THEN a_mata_kuliah.unique_code
                                                ELSE a_mata_kuliah.m_class_code
                                            END as classcode, a_mata_kuliah.semester,
                                            a_mata_kuliah.master_id as id, a_mata_kuliah.mata_kuliah_code as id_subject,
                                            a_mata_kuliah.unique_code, m_mata_kuliah.name as subject, a_mata_kuliah.dosen_nidn as id_lecture,
                                            m_dosen.name as lecturer_name, a_mata_kuliah.level as lecturer_level, a_mata_kuliah.sks as lecturer_sks,
                                            a_mata_kuliah.year as semester_year, a_mata_kuliah.created_at as createdat')
                                ->leftJoin('m_dosen', 'a_mata_kuliah.dosen_nidn', '=', 'm_dosen.nidn')
                                ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->first();
        $aMataKuliah['departement_name'] = $getUserProdi['name'];
        $aMataKuliah['fakultas'] = 'Teknik';
        return response()->json($aMataKuliah);
    }

    public function tableDataAssessment(Request $request)
    {
        $getData = AMataKuliah::selectRaw('m_course_works.id as cwId, m_cpmk.id as cpmkid, a_cw_question_cpmk.weight, m_course_works.name, 
                                            a_mata_kuliah.scale_task, a_mata_kuliah.scale_exam, a_mata_kuliah.total_task,
                                            a_mata_kuliah.scale_task_detail')
                                ->join('a_mata_kuliah_cpmk', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_cpmk.a_mata_kuliah_id')
                                ->join('m_cpmk', 'a_mata_kuliah_cpmk.cpmk_id', '=', 'm_cpmk.id')
                                ->join('a_cw_question_cpmk', 'a_mata_kuliah_cpmk.id', '=', 'a_cw_question_cpmk.a_mata_kuliah_cpmk_id')
                                ->join('a_course_work_questions', 'a_cw_question_cpmk.a_cw_question_id', '=', 'a_course_work_questions.id')
                                ->join('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                                ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->orderBy('m_course_works.name', 'ASC')
                                ->orderBy('a_mata_kuliah_cpmk.id', 'ASC')
                                ->get();

        $getCpmk = AMataKuliah::selectRaw('m_cpmk.id as cpmkid')
                                ->join('a_mata_kuliah_cpmk', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_cpmk.a_mata_kuliah_id')
                                ->join('m_cpmk', 'a_mata_kuliah_cpmk.cpmk_id', '=', 'm_cpmk.id')
                                ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->orderBy('a_mata_kuliah_cpmk.id', 'ASC')
                                ->get();

        $arrTaskTemp = [];
        $stateTaskTemp = null;
        // dd($getCpmk->toArray());
        $firstCpmkId = $getCpmk[0]['cpmkid'] - 1 ;
        $data = [];
        $allCpmk = [];
        foreach ($getData as $keyGetData => $valueGetData) {
            array_push($allCpmk, $valueGetData->cpmkid);
        }
        $allCpmk = array_unique($allCpmk);
        sort($allCpmk);

        // dd($getData->toArray());
        
        foreach ($getData as $keyGetData => $valueGetData) {
            foreach ($getCpmk as $keyGetCpmk => $valueGetCpmk) {
                if ($stateTaskTemp == null) {
                    $arrTaskTemp['cw_name'] = $valueGetData['name'];
                    $arrTaskTemp['marks'] = (($valueGetData['name'] == 'UAS') ? $valueGetData['scale_exam'] : (($valueGetData['scale_task_detail'] != null) ? json_decode($valueGetData['scale_task_detail'])->{$valueGetData['name']} : 0));
                    if ($valueGetCpmk['cpmkid'] == $valueGetData['cpmkid']) {
                        $arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1] = true;
                        // dump('cpmk'.($valueGetCpmk['cpmkid']-$firstCpmkId));
                    }else{
                        try {
                            if (!$arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1]) {}
                        } catch (\Throwable $th) {
                            // $arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1] = false;
                        }
                    }
                    $stateTaskTemp = $valueGetData['name'];
                }elseif ($stateTaskTemp != $valueGetData['name']) {
                    array_push($data, $arrTaskTemp);
                    $stateTaskTemp = $valueGetData['name'];
                    $arrTaskTemp = [];
                    $arrTaskTemp['cw_name'] = $valueGetData['name'];
                    $arrTaskTemp['marks'] = (($valueGetData['name'] == 'UAS') ? $valueGetData['scale_exam'] : (($valueGetData['scale_task_detail'] != null) ? json_decode($valueGetData['scale_task_detail'])->{$valueGetData['name']} : 0));
                    if ($valueGetCpmk['cpmkid'] == $valueGetData['cpmkid']) {
                        $arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1] = true;
                    }else{
                        try {
                            if (!$arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1]) {}
                        } catch (\Throwable $th) {
                            // $arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1] = false;
                        }
                    }
                }else{
                    if ($valueGetCpmk['cpmkid'] == $valueGetData['cpmkid']) {
                        $arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1] = true;
                    }else{
                        try {
                            if (!$arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1]) {}
                        } catch (\Throwable $th) {
                            // $arrTaskTemp['cpmk'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1] = false;
                        }
                    }
                }
            }
        }
        
        $arrHeader = [
            [
                'id' => 1,
                'field' => 'cw_name',
                'name' => 'Course Work'
            ],
            [
                'id' => 2,
                'field' => 'marks',
                'name' => 'Marks'
            ],
        ];

        for ($i=0; $i < count($getCpmk); $i++) { 
            array_push($arrHeader, [
                'id' => 3 + $i,
                'field' => 'cpmk'.$i + 1,
                'name' => 'CPMK'.$i + 1,
            ]);
        }

        array_push($data, $arrTaskTemp);

        return response()->json([
            [
                'list_headers' => $arrHeader,
                'data' => $data,
                'test' => $getData
            ]
        ]);
    }

    public function cwCpmkMap(Request $request)
    {

        $getData = ACwQuestionCpmk::selectRaw('m_cpmk.id as cpmkid, m_course_works.name as courseWorkName, 
                                                m_questions.name as questionname, a_cw_question_cpmk.weight')
                                ->join('a_mata_kuliah_cpmk', 'a_cw_question_cpmk.a_mata_kuliah_cpmk_id', '=', 'a_mata_kuliah_cpmk.id')
                                ->join('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                ->join('a_course_work_questions', 'a_cw_question_cpmk.a_cw_question_id', '=', 'a_course_work_questions.id')
                                ->join('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                                ->join('m_questions', 'a_course_work_questions.question_id', '=', 'm_questions.id')
                                ->join('m_cpmk', 'a_mata_kuliah_cpmk.cpmk_id', '=', 'm_cpmk.id')
                                ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->orderBy('m_course_works.name')
                                ->orderBy('m_cpmk.id', 'ASC')
                                ->get();

        $datas  = [];
        $stateCw = null;
        $tempData = [];
        $tempListHeader = [
            'id' => 1,
            'field' => 'cpmks',
            'name' => 'CPMKs'
        ];
        $firstCpmk = $getData[0];

        $tempNilaiMax = [
            [
                'id' => 1,
                'field' => 'Nilai Maks',
                'name' => 'nilai_maks',
            ],
        ];
        $temp['P1'] = 0;
        $temp['P2'] = 0;
        $temp['P3'] = 0;
        $temp['P4'] = 0;
        $temp['P5'] = 0;
        $temp['P6'] = 0;
        $temp['P7'] = 0;
        $temp['P8'] = 0;

        $allCpmk = [];
        foreach ($getData as $keyGetData => $valueGetData) {
            array_push($allCpmk, $valueGetData->cpmkid);
        }
        $allCpmk = array_unique($allCpmk);

        sort($allCpmk);

        // dd($getData->toArray());
        foreach ($getData as $keyGetData => $valueGetData) {
            if ($stateCw == null) {
                $stateCw = $valueGetData['courseworkname'];

                // dump($valueGetData['cpmkid'] - $firstCpmk['cpmkid'] + 1 . '  <> LINE 246');
                array_push($tempData, [
                    'cpmks' => 'CPMK'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1,
                    'cpmksum' => $valueGetData['weight'],
                    'p1' => $valueGetData['questionname'] == 'P1' ? $valueGetData['weight'] : null,
                    'p2' => $valueGetData['questionname'] == 'P2' ? $valueGetData['weight'] : null,
                    'p3' => $valueGetData['questionname'] == 'P3' ? $valueGetData['weight'] : null,
                    'p4' => $valueGetData['questionname'] == 'P4' ? $valueGetData['weight'] : null,
                    'p5' => $valueGetData['questionname'] == 'P5' ? $valueGetData['weight'] : null,
                    'p6' => $valueGetData['questionname'] == 'P6' ? $valueGetData['weight'] : null,
                    'p7' => $valueGetData['questionname'] == 'P7' ? $valueGetData['weight'] : null,
                    'p8' => $valueGetData['questionname'] == 'P8' ? $valueGetData['weight'] : null,
                ]);
                
                for ($i=1; $i <= 8 ; $i++) { 
                    if ($valueGetData['questionname'] == 'P'.$i) {
                        if($temp['P'.$i] < $valueGetData['weight']){
                            $temp['P'.$i] = $valueGetData['weight'];
                        }
                    }
                }

            }else if($stateCw == $valueGetData['courseworkname']){
                $stateCw = $valueGetData['courseworkname'];
                
                // dump($valueGetData['cpmkid'] .'  '. $firstCpmk['cpmkid'] + 1 . '  <> LINE 271');
                array_push($tempData, [
                    'cpmks' => 'CPMK'.((int)array_search($valueGetData['cpmkid'], $allCpmk))+1,
                    'cpmksum' => $valueGetData['weight'],
                    'p1' => $valueGetData['questionname'] == 'P1' ? $valueGetData['weight'] : null,
                    'p2' => $valueGetData['questionname'] == 'P2' ? $valueGetData['weight'] : null,
                    'p3' => $valueGetData['questionname'] == 'P3' ? $valueGetData['weight'] : null,
                    'p4' => $valueGetData['questionname'] == 'P4' ? $valueGetData['weight'] : null,
                    'p5' => $valueGetData['questionname'] == 'P5' ? $valueGetData['weight'] : null,
                    'p6' => $valueGetData['questionname'] == 'P6' ? $valueGetData['weight'] : null,
                    'p7' => $valueGetData['questionname'] == 'P7' ? $valueGetData['weight'] : null,
                    'p8' => $valueGetData['questionname'] == 'P8' ? $valueGetData['weight'] : null,
                ]);
                
                for ($i=1; $i <= 8 ; $i++) { 
                    if ($valueGetData['questionname'] == 'P'.$i) {
                        if($temp['P'.$i] < $valueGetData['weight']){
                            $temp['P'.$i] = $valueGetData['weight'];
                        }
                    }
                }

            }else if ($stateCw != $valueGetData['courseworkname']){
                
                for ($j=1; $j <= 8 ; $j++) { 
                    array_push($tempNilaiMax, [
                        'id' => count($tempNilaiMax) + 1,
                        'field' => $temp['P'.$j],
                        'name' => 'nilai_maks_p'.$j,
                    ]);
                }

                array_push($datas, [
                    'id' => $stateCw == 'UAS' ? 'cw_uas' : 'cw_cpmk'.str_replace('Tugas ', '', $stateCw),
                    'title' => $stateCw == 'UAS' ? 'EXAM | UAS' : 'COURSE WORK '.(str_replace('Tugas', '', $stateCw)).' | TUGAS '.(str_replace('Tugas', '', $stateCw)),
                    'list_headers' => [
                        [
                            'id' => 1,
                            'field' => 'cpmks',
                            'name' => 'CPMKs'
                        ],
                        [
                            'id' => 2,
                            'field' => 'p1',
                            'name' => 'P1'
                        ],
                        [
                            'id' => 3,
                            'field' => 'p2',
                            'name' => 'P2'
                        ],
                        [
                            'id' => 4,
                            'field' => 'p3',
                            'name' => 'P3'
                        ],
                        [
                            'id' => 5,
                            'field' => 'p4',
                            'name' => 'P4'
                        ],
                        [
                            'id' => 6,
                            'field' => 'p5',
                            'name' => 'P5'
                        ],
                        [
                            'id' => 7,
                            'field' => 'p6',
                            'name' => 'P6'
                        ],
                        [
                            'id' => 8,
                            'field' => 'p7',
                            'name' => 'P7'
                        ],
                        [
                            'id' => 9,
                            'field' => 'p8',
                            'name' => 'P8'
                        ]
                    ],
                    'list_nilai_max' => $tempNilaiMax,
                    'data' => $tempData
                ]);

                $tempData = [];
                $tempListHeader = [
                    'id' => 1,
                    'field' => 'cpmks',
                    'name' => 'CPMKs'
                ];
                $stateCw = $valueGetData['courseworkname'];

                $tempNilaiMax = [
                    [
                        'id' => 1,
                        'field' => 'Nilai Maks',
                        'name' => 'nilai_maks',
                    ],
                ];
                $temp['P1'] = 0;
                $temp['P2'] = 0;
                $temp['P3'] = 0;
                $temp['P4'] = 0;
                $temp['P5'] = 0;
                $temp['P6'] = 0;
                $temp['P7'] = 0;
                $temp['P8'] = 0;

                // dump($valueGetData['cpmkid'] - $firstCpmk['cpmkid'] + 1 . '  <> LINE 381');
                array_push($tempData, [
                    'cpmks' => 'CPMK'.($valueGetData['cpmkid'] - $firstCpmk['cpmkid'] + 1),
                    'cpmksum' => $valueGetData['weight'],
                    'p1' => $valueGetData['questionname'] == 'P1' ? $valueGetData['weight'] : null,
                    'p2' => $valueGetData['questionname'] == 'P2' ? $valueGetData['weight'] : null,
                    'p3' => $valueGetData['questionname'] == 'P3' ? $valueGetData['weight'] : null,
                    'p4' => $valueGetData['questionname'] == 'P4' ? $valueGetData['weight'] : null,
                    'p5' => $valueGetData['questionname'] == 'P5' ? $valueGetData['weight'] : null,
                    'p6' => $valueGetData['questionname'] == 'P6' ? $valueGetData['weight'] : null,
                    'p7' => $valueGetData['questionname'] == 'P7' ? $valueGetData['weight'] : null,
                    'p8' => $valueGetData['questionname'] == 'P8' ? $valueGetData['weight'] : null,
                ]);

                
                for ($i=1; $i <= 8 ; $i++) { 
                    if ($valueGetData['questionname'] == 'P'.$i) {
                        if($temp['P'.$i] < $valueGetData['weight']){
                            $temp['P'.$i] = $valueGetData['weight'];
                        }
                    }
                }
            }
        }
        
        for ($j=1; $j <= 8 ; $j++) { 
            array_push($tempNilaiMax, [
                'id' => count($tempNilaiMax) + 1,
                'field' => $temp['P'.$j],
                'name' => 'nilai_maks_p'.$j,
            ]);
        }

        array_push($datas, [
            'id' => $stateCw == 'UAS' ? 'cw_uas' : 'cw_cpl'.$keyGetData+1,
            'title' => $stateCw == 'UAS' ? 'EXAM | UAS' : 'COURSE WORK '.($keyGetData+1).' | TUGAS '.($keyGetData+1),
            'list_headers' => [
                [
                    'id' => 1,
                    'field' => 'cpmks',
                    'name' => 'CPMKs'
                ],
                [
                    'id' => 2,
                    'field' => 'p1',
                    'name' => 'P1'
                ],
                [
                    'id' => 3,
                    'field' => 'p2',
                    'name' => 'P2'
                ],
                [
                    'id' => 4,
                    'field' => 'p3',
                    'name' => 'P3'
                ],
                [
                    'id' => 5,
                    'field' => 'p4',
                    'name' => 'P4'
                ],
                [
                    'id' => 6,
                    'field' => 'p5',
                    'name' => 'P5'
                ],
                [
                    'id' => 7,
                    'field' => 'p6',
                    'name' => 'P6'
                ],
                [
                    'id' => 8,
                    'field' => 'p7',
                    'name' => 'P7'
                ],
                [
                    'id' => 9,
                    'field' => 'p8',
                    'name' => 'P8'
                ]
            ],
            'list_nilai_max' => $tempNilaiMax,
            'data' => $tempData
        ]);
                                
        return response()->json($datas);
    }

    public function cwCplMap(Request $request)
    {
        $getData = ACwQuestionCpl::selectRaw('m_cpl.id as cplid, m_cpl.code, m_course_works.name as courseWorkName, 
                                                m_questions.name as questionname, a_cw_question_cpl.weight')
                                ->join('a_mata_kuliah_cpl', 'a_cw_question_cpl.a_mata_kuliah_cpl_id', '=', 'a_mata_kuliah_cpl.id')
                                ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                ->join('a_course_work_questions', 'a_cw_question_cpl.a_cw_question_id', '=', 'a_course_work_questions.id')
                                ->join('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                                ->join('m_questions', 'a_course_work_questions.question_id', '=', 'm_questions.id')
                                ->join('m_cpl', 'a_mata_kuliah_cpl.cpl_id', '=', 'm_cpl.id')
                                ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->orderBy('m_course_works.name')
                                ->get();

        $datas  = [];
        $stateCw = null;
        $tempData = [];
        $firstCpl = $getData[0];
        $tempNilaiMax = [
            [
                'id' => 1,
                'field' => 'Nilai Maks',
                'name' => 'nilai_maks',
            ],
        ];
        $temp['P1'] = 0;
        $temp['P2'] = 0;
        $temp['P3'] = 0;
        $temp['P4'] = 0;
        $temp['P5'] = 0;
        $temp['P6'] = 0;
        $temp['P7'] = 0;
        $temp['P8'] = 0;

        foreach ($getData as $keyGetData => $valueGetData) {
            if ($stateCw == null) {
                $stateCw = $valueGetData['courseworkname'];

                array_push($tempData, [
                    'cpls' => $valueGetData['code'],
                    'cplsum' => $valueGetData['weight'],
                    'p1' => $valueGetData['questionname'] == 'P1' ? $valueGetData['weight'] : null,
                    'p2' => $valueGetData['questionname'] == 'P2' ? $valueGetData['weight'] : null,
                    'p3' => $valueGetData['questionname'] == 'P3' ? $valueGetData['weight'] : null,
                    'p4' => $valueGetData['questionname'] == 'P4' ? $valueGetData['weight'] : null,
                    'p5' => $valueGetData['questionname'] == 'P5' ? $valueGetData['weight'] : null,
                    'p6' => $valueGetData['questionname'] == 'P6' ? $valueGetData['weight'] : null,
                    'p7' => $valueGetData['questionname'] == 'P7' ? $valueGetData['weight'] : null,
                    'p8' => $valueGetData['questionname'] == 'P8' ? $valueGetData['weight'] : null,
                ]);

                for ($i=1; $i <= 8 ; $i++) { 
                    if ($valueGetData['questionname'] == 'P'.$i) {
                        if($temp['P'.$i] < $valueGetData['weight']){
                            $temp['P'.$i] = $valueGetData['weight'];
                        }
                    }
                }

            }else if($stateCw == $valueGetData['courseworkname']){
                $stateCw = $valueGetData['courseworkname'];
                array_push($tempData, [
                    'cpls' => $valueGetData['code'],
                    'cplsum' => $valueGetData['weight'],
                    'p1' => $valueGetData['questionname'] == 'P1' ? $valueGetData['weight'] : null,
                    'p2' => $valueGetData['questionname'] == 'P2' ? $valueGetData['weight'] : null,
                    'p3' => $valueGetData['questionname'] == 'P3' ? $valueGetData['weight'] : null,
                    'p4' => $valueGetData['questionname'] == 'P4' ? $valueGetData['weight'] : null,
                    'p5' => $valueGetData['questionname'] == 'P5' ? $valueGetData['weight'] : null,
                    'p6' => $valueGetData['questionname'] == 'P6' ? $valueGetData['weight'] : null,
                    'p7' => $valueGetData['questionname'] == 'P7' ? $valueGetData['weight'] : null,
                    'p8' => $valueGetData['questionname'] == 'P8' ? $valueGetData['weight'] : null,
                ]);

                
                for ($i=1; $i <= 8 ; $i++) { 
                    if ($valueGetData['questionname'] == 'P'.$i) {
                        if($temp['P'.$i] < $valueGetData['weight']){
                            $temp['P'.$i] = $valueGetData['weight'];
                        }
                    }
                }
            }else if ($stateCw != $valueGetData['courseworkname']){
                $dataNilaiMax = [];

                for ($j=1; $j <= 8 ; $j++) { 
                    array_push($tempNilaiMax, [
                        'id' => count($tempNilaiMax) + 1,
                        'field' => $temp['P'.$j],
                        'name' => 'nilai_maks_p'.$j,
                    ]);
                }

                array_push($datas, [
                    'id' => $stateCw == 'UAS' ? 'cw_uas' : 'cw_cpl'.str_replace('Tugas ', '', $stateCw),
                    'title' => $stateCw == 'UAS' ? 'EXAM | UAS' : 'COURSE WORK '.(str_replace('Tugas', '', $stateCw)).' | TUGAS '.(str_replace('Tugas', '', $stateCw)),
                    'list_headers' => [
                        [
                            'id' => 1,
                            'field' => 'cpls',
                            'name' => 'CPLs'
                        ],
                        [
                            'id' => 2,
                            'field' => 'p1',
                            'name' => 'P1'
                        ],
                        [
                            'id' => 3,
                            'field' => 'p2',
                            'name' => 'P2'
                        ],
                        [
                            'id' => 4,
                            'field' => 'p3',
                            'name' => 'P3'
                        ],
                        [
                            'id' => 5,
                            'field' => 'p4',
                            'name' => 'P4'
                        ],
                        [
                            'id' => 6,
                            'field' => 'p5',
                            'name' => 'P5'
                        ],
                        [
                            'id' => 7,
                            'field' => 'p6',
                            'name' => 'P6'
                        ],
                        [
                            'id' => 8,
                            'field' => 'p7',
                            'name' => 'P7'
                        ],
                        [
                            'id' => 9,
                            'field' => 'p8',
                            'name' => 'P8'
                        ]
                    ],
                    'list_nilai_max' => $tempNilaiMax,
                    'data' => $tempData
                ]);

                $temp['P1'] = 0;
                $temp['P2'] = 0;
                $temp['P3'] = 0;
                $temp['P4'] = 0;
                $temp['P5'] = 0;
                $temp['P6'] = 0;
                $temp['P7'] = 0;
                $temp['P8'] = 0;

                $tempData = [];
                $tempNilaiMax = [
                    [
                        'id' => 1,
                        'field' => 'Nilai Maks',
                        'name' => 'nilai_maks',
                    ],
                ];
                $stateCw = $valueGetData['courseworkname'];

                array_push($tempData, [
                    'cpls' => $valueGetData['code'],
                    'cplsum' => $valueGetData['weight'],
                    'p1' => $valueGetData['questionname'] == 'P1' ? $valueGetData['weight'] : null,
                    'p2' => $valueGetData['questionname'] == 'P2' ? $valueGetData['weight'] : null,
                    'p3' => $valueGetData['questionname'] == 'P3' ? $valueGetData['weight'] : null,
                    'p4' => $valueGetData['questionname'] == 'P4' ? $valueGetData['weight'] : null,
                    'p5' => $valueGetData['questionname'] == 'P5' ? $valueGetData['weight'] : null,
                    'p6' => $valueGetData['questionname'] == 'P6' ? $valueGetData['weight'] : null,
                    'p7' => $valueGetData['questionname'] == 'P7' ? $valueGetData['weight'] : null,
                    'p8' => $valueGetData['questionname'] == 'P8' ? $valueGetData['weight'] : null,
                ]);
                
                for ($i=1; $i <= 8 ; $i++) { 
                    if ($valueGetData['questionname'] == 'P'.$i) {
                        if($temp['P'.$i] < $valueGetData['weight']){
                            $temp['P'.$i] = $valueGetData['weight'];
                        }
                    }
                }
            }
        }
        
        for ($j=1; $j <= 8 ; $j++) { 
            array_push($tempNilaiMax, [
                'id' => count($tempNilaiMax) + 1,
                'field' => $temp['P'.$j],
                'name' => 'nilai_maks_p'.$j,
            ]);
        }

        array_push($datas, [
            'id' => $stateCw == 'UAS' ? 'cw_uas' : 'cw_cpl'.$keyGetData+1,
            'title' => $stateCw == 'UAS' ? 'EXAM | UAS' : 'COURSE WORK '.($keyGetData+1).' | TUGAS '.($keyGetData+1),
            'list_headers' => [
                [
                    'id' => 1,
                    'field' => 'cpls',
                    'name' => 'CPLs'
                ],
                [
                    'id' => 2,
                    'field' => 'p1',
                    'name' => 'P1'
                ],
                [
                    'id' => 3,
                    'field' => 'p2',
                    'name' => 'P2'
                ],
                [
                    'id' => 4,
                    'field' => 'p3',
                    'name' => 'P3'
                ],
                [
                    'id' => 5,
                    'field' => 'p4',
                    'name' => 'P4'
                ],
                [
                    'id' => 6,
                    'field' => 'p5',
                    'name' => 'P5'
                ],
                [
                    'id' => 7,
                    'field' => 'p6',
                    'name' => 'P6'
                ],
                [
                    'id' => 8,
                    'field' => 'p7',
                    'name' => 'P7'
                ],
                [
                    'id' => 9,
                    'field' => 'p8',
                    'name' => 'P8'
                ]
            ],
            'list_nilai_max' => $tempNilaiMax,
            'data' => $tempData
        ]);
                                
        return response()->json($datas);
    }

    public function indexChartCpmk(Request $request)
    {
        $matkulCpmk = DB::select("
            SELECT a_mata_kuliah_cpmk.id as cpmk_id, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpmk.weight)) * 100 / COUNT(a_cw_question_cpmk.a_mata_kuliah_cpmk_id) as dataCpmkRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpmk.weight) * 4) / COUNT(a_cw_question_cpmk.a_mata_kuliah_cpmk_id) as dataCpmkRate4
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpmk ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpmk.a_cw_question_id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpmk.*
                FROM a_mata_kuliah_cpmk
                JOIN a_mata_kuliah ON a_mata_kuliah_cpmk.a_mata_kuliah_id = a_mata_kuliah.id
                WHERE a_mata_kuliah.unique_code = '".$request['uniqueCode']."'
            )a_mata_kuliah_cpmk ON a_cw_question_cpmk.a_mata_kuliah_cpmk_id = a_mata_kuliah_cpmk.id
            JOIN m_cpmk ON a_mata_kuliah_cpmk.cpmk_id = m_cpmk.id
            JOIN a_course_work_questions ON a_cw_question_cpmk.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request['uniqueCode']."'
            GROUP BY a_mata_kuliah_cpmk.id
            ORDER BY a_mata_kuliah_cpmk.id ASC
        ");

        $arrRate100 = [0];
        $arrRate4 = [0];
        $arrCategories = [''];
        foreach ($matkulCpmk as $keyMatkulCpmk => $valueMatkulCpmk) {
            array_push($arrRate100, (float)number_format($valueMatkulCpmk->datacpmkrate100, 2));
            array_push($arrRate4, (float)number_format($valueMatkulCpmk->datacpmkrate4, 2));
            array_push($arrCategories, 'CPMK'.$keyMatkulCpmk + 1);
        }
        array_push($arrRate100, 0);
        array_push($arrRate4, 0);
        array_push($arrCategories, '');

        return response()->json([
            'data' => [
                'id' => 1,
                'data_categories' => $arrCategories,
                'data_series' => [
                    [
                        'name' => 'Rate_100',
                        'data' => $arrRate100,
                    ],
                    [
                        'name' => 'Rate_4',
                        'data' => $arrRate4,
                    ]
                ]
            ]
        ]);
    }
    public function indexChartCpl(Request $request)
    {
        $matkulCpl = DB::select("
            SELECT 
                code, AVG(scale100) as scale100, AVG(scale4) as scale4
            FROM (   
                SELECT 
                    idcpl as id, code, courseworkcpl, questioncpl, AVG(float4(weightmhs) / float4(weightcpl) * 100) as scale100,
                    AVG(float4(weightmhs) / float4(weightcpl) * 4) as scale4
                FROM (   
                    SELECT amk.id as idcpl, mc.code, mcwcpl.name as courseworkcpl, mqcpl.name as questioncpl, acqcpl.weight as weightcpl
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    JOIN m_cpl mc ON amkcpl.cpl_id = mc.id
                    JOIN a_cw_question_cpl acqcpl ON amkcpl.id = acqcpl.a_mata_kuliah_cpl_id
                    JOIN a_course_work_questions acwqcpl ON acqcpl.a_cw_question_id = acwqcpl.id
                    JOIN m_course_works mcwcpl ON acwqcpl.course_work_id = mcwcpl.id
                    JOIN m_questions mqcpl ON acwqcpl.question_id = mqcpl.id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    AND amk.unique_code = '".$request->uniqueCode."'
                    GROUP BY mcwcpl.id, mqcpl.id, amk.id, acqcpl.weight, mc.code
                    ORDER BY amk.id, mcwcpl.id, mqcpl.id
                ) main
                JOIN (
                    SELECT amk.id as idmhs, mm.nim, mcw.name as courseworkmhs, mq.name as questionmhs, acqmhs.weight as weightmhs
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_mahasiswa amkmhs ON amk.id = amkmhs.a_mata_kuliah_id
                    JOIN a_mahasiswa_program_studies amps ON amkmhs.a_mahasiswa_program_study_id = amps.id
                    JOIN m_mahasiswa mm ON amps.m_mahasiswa_nim = mm.nim
                    JOIN a_cw_question_mhs acqmhs ON amkmhs.id = acqmhs.a_mata_kuliah_mahasiswa_id
                    JOIN a_course_work_questions acwq ON acqmhs.a_cw_question_id = acwq.id
                    JOIN m_course_works mcw ON acwq.course_work_id = mcw.id
                    JOIN m_questions mq ON acwq.question_id = mq.id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    AND amk.unique_code = '".$request->uniqueCode."'
                    GROUP BY mcw.id, mq.id, amk.id, acqmhs.weight, mm.nim
                    ORDER BY amk.id, mcw.id, mq.id
                ) secondary ON main.idcpl = secondary.idmhs AND main.courseworkcpl = secondary.courseworkmhs AND main.questioncpl = secondary.questionmhs
                GROUP BY idcpl, courseworkcpl, questioncpl, code
            ) main2
            GROUP BY code
            ORDER BY code ASC
        ");

        $arrRate100 = [0];
        $arrRate4 = [0];
        $arrCategories = [''];

        foreach ($matkulCpl as $keyMatkulCpl => $valueMatkulCpl) {
            array_push($arrRate100, (float)number_format($valueMatkulCpl->scale100, 2));
            array_push($arrRate4, (float)number_format($valueMatkulCpl->scale4, 2));
            array_push($arrCategories, $valueMatkulCpl->code);
        }
        array_push($arrRate100, 0);
        array_push($arrRate4, 0);
        array_push($arrCategories, '');

        return response()->json([
            'data' => [
                'id' => 1,
                'data_categories' => $arrCategories,
                'data_series' => [
                    [
                        'name' => 'Rate_100',
                        'data' => $arrRate100,
                    ],
                    [
                        'name' => 'Rate_4',
                        'data' => $arrRate4,
                    ]
                ]
            ],
            'dataTest' => $matkulCpl
        ]);
    }
    public function indexChartCompetencies(Request $request)
    {
        $arrMatkulGetData = null;
        $arrMatkulGetData .= "
            SELECT name, AVG(datacplrate4) as datacplrate4
            FROM (
                SELECT m_competencies.name, m_cpl.code as code, a_mata_kuliah.unique_code, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
                FROM a_mata_kuliah
                JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
                JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
                LEFT JOIN (
                    SELECT a_mata_kuliah_cpl.*
                    FROM a_mata_kuliah_cpl
                    JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                    WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
                JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
                JOIN a_cpl_competencies ON a_mata_kuliah_cpl.id = a_cpl_competencies.a_mata_kuliah_cpl_id
                JOIN a_mata_kuliah_competencies ON a_cpl_competencies.a_mata_kuliah_competencies_id = a_mata_kuliah_competencies.id
                JOIN m_competencies ON a_mata_kuliah_competencies.competencies_id = m_competencies.id
                JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
                JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
                JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
                WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                AND a_mata_kuliah.deleted_at IS NULL
                GROUP BY a_mata_kuliah.unique_code, m_cpl.code, m_competencies.name
            ) main
            GROUP BY name
        ";

        $getDataTemp = DB::select(DB::raw($arrMatkulGetData));

        $dataWeight = [];
        $dataCategories = [];

        foreach ($getDataTemp as $key => $value) {
            array_push($dataCategories, $value->name);
            array_push($dataWeight, $value->datacplrate4);
        }

        return response()->json([
            'data' => [
                [
                    'id' => 1,
                    'data_categories' => $dataCategories,
                    'data_series' => $dataWeight
                ],
            ]
        ]);
    }
    public function indexTableStudentScore(Request $request)
    {
        $getData = AMataKuliah::selectRaw('m_mahasiswa.name as mhsName, m_mahasiswa.nim as mhsNim, a_mata_kuliah_mahasiswa.presence as kehadiran, 
                                            m_course_works.name as cwname, a_cw_question_mhs.weight, m_mahasiswa.created_at,
                                            a_mata_kuliah.scale_task, a_mata_kuliah.scale_exam, a_mata_kuliah.total_task, a_mata_kuliah.scale_task_detail')
                    ->join('a_mata_kuliah_mahasiswa', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_mahasiswa.a_mata_kuliah_id')
                    ->join('a_mahasiswa_program_studies', 'a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id', '=', 'a_mahasiswa_program_studies.id')
                    ->join('m_mahasiswa', 'a_mahasiswa_program_studies.m_mahasiswa_nim', '=', 'm_mahasiswa.nim')
                    ->leftJoin('a_cw_question_mhs', 'a_mata_kuliah_mahasiswa.id', '=', 'a_cw_question_mhs.a_mata_kuliah_mahasiswa_id')
                    ->leftJoin('a_course_work_questions', 'a_cw_question_mhs.a_cw_question_id', '=', 'a_course_work_questions.id')
                    ->leftJoin('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                    ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                    ->where('a_mata_kuliah.deleted_at', null)
                    ->get();
        $dataMhs = [];
        $stateMhsName = null;
        $stateMhsNim = null;
        $stateKehadiran = null;
        $stateCw = null;
        $stateCwDetail = null;
        $tempWeightTugas = [];
        $tempWeightTugasKey = [];
        $tempWeightUas = 0;
        $totalWeightTugas = 0;
        $totalWeightUas = 0;
        $scaleTaskDetail = null;
        foreach ($getData as $keyGetData => $valueGetData) {
            $scaleTaskDetail = (array)json_decode($valueGetData['scale_task_detail']);
            // dd($scaleTaskDetail[$valueGetData['cwname']]);
            if ($stateMhsName == null) {
                $stateMhsName = $valueGetData['mhsname'];
                $stateMhsNim = $valueGetData['mhsnim'];
                $stateKehadiran = $valueGetData['kehadiran'];
                $stateCw = explode(' ', $valueGetData['cwname'])[0];
                $stateCwDetail = $valueGetData['cwname'];
                
                if (explode(' ', $valueGetData['cwname'])[0] == 'Tugas') {
                    if (! array_key_exists($valueGetData['cwname'],$tempWeightTugas)) {
                        $tempWeightTugas[$valueGetData['cwname']] = 0;
                        array_push($tempWeightTugasKey, $valueGetData['cwname']);
                    }
                    $tempWeightTugas[$valueGetData['cwname']] += (float)$valueGetData['weight'];
                    $totalWeightTugas += 1;
                }else if($valueGetData['cwname'] == 'UAS'){
                    $tempWeightUas += (float)$valueGetData['weight'];
                    $totalWeightUas += 1;
                }
                // dd($totalWeightTugas);
            }else{
                if ($valueGetData['mhsname'] != $stateMhsName) {
                    $totals = 0;
                    foreach ($tempWeightTugasKey as $keyTugas => $valueTugas) {
                        try {
                            $totals += ((float)$tempWeightTugas[$valueTugas] * $scaleTaskDetail[$valueTugas]);
                        } catch (\Throwable $th) {}
                    }
                    $cw100 = $totals / $valueGetData['scale_task'];
                    $exam100 = $tempWeightUas;
                    $finalScore = ($cw100 * (float)$valueGetData['scale_task'] / 100) + ($exam100 * (float)$valueGetData['scale_exam'] / 100);

                    // $checkScore = MScore::where('int4(min_point)', '<', $finalScore)
                    //                     ->where('int4(max_point)', '>', $finalScore)
                    //                     ->first();

                    $checkScore = DB::select("
                                        SELECT code
                                        FROM m_score
                                        WHERE float4(min_point) < '".(float)$finalScore."'
                                        AND float4(max_point) >= '".(float)$finalScore."'
                                    ");
                    $getCode = null;
                    try {
                        $getCode = $checkScore[0]->code;
                    } catch (\Throwable $th) {
                        //throw $th;
                    }
                    
                    // dd(number_format($cw100 * (float)$valueGetData['scale_task'] / 100,2));
                    array_push($dataMhs, [
                        'name' => explode('(', $stateMhsName)[0],
                        'nim' => $stateMhsNim,
                        'kehadiran' => $stateKehadiran,
                        'cw100' => number_format($cw100, 2),
                        'cw60' => number_format($cw100 * (float)$valueGetData['scale_task'] / 100,2),
                        'exam100' => number_format($exam100, 2),
                        'exam40' => number_format($exam100 * (float)$valueGetData['scale_exam'] / 100, 2),
                        'final_score' => number_format($finalScore, 2),
                        'grade' => $getCode,
                        'date' => Carbon::parse($valueGetData['created_at'])->format('Y/m/d'),
                    ]);

                    $tempWeightTugas = [];
                    $tempWeightTugasKey = [];
                    $tempWeightUas = 0;
                    $totalWeightTugas = 0;
                    $totalWeightUas = 0;
                    $stateMhsName = $valueGetData['mhsname'];
                    $stateMhsNim = $valueGetData['mhsnim'];
                    $stateKehadiran = $valueGetData['kehadiran'];
                    $stateCw = explode(' ', $valueGetData['cwname'])[0];
                    $stateCwDetail = $valueGetData['cwname'];
                    
                    if (explode(' ', $valueGetData['cwname'])[0] == 'Tugas') {
                        if (! array_key_exists($valueGetData['cwname'],$tempWeightTugas)) {
                            $tempWeightTugas[$valueGetData['cwname']] = 0;
                            array_push($tempWeightTugasKey, $valueGetData['cwname']);
                        }
                        $tempWeightTugas[$valueGetData['cwname']] += (float)$valueGetData['weight'];
                        $totalWeightTugas += 1;
                    }else if($valueGetData['cwname'] == 'UAS'){
                        $tempWeightUas += (float)$valueGetData['weight'];
                        $totalWeightUas += 1;
                    }
                }else{
                    if (explode(' ', $valueGetData['cwname'])[0] == 'Tugas') {
                        if (! array_key_exists($valueGetData['cwname'],$tempWeightTugas)) {
                            $tempWeightTugas[$valueGetData['cwname']] = 0;
                            array_push($tempWeightTugasKey, $valueGetData['cwname']);
                        }
                        $tempWeightTugas[$valueGetData['cwname']] += (float)$valueGetData['weight'];
                        $totalWeightTugas += 1;
                    }else if($valueGetData['cwname'] == 'UAS'){
                        $tempWeightUas += (float)$valueGetData['weight'];
                        $totalWeightUas += 1;
                    }
                }
            }
        }
        $totals = 0;
        foreach ($tempWeightTugasKey as $keyTugas => $valueTugas) {
            try {
                $totals += ((float)$tempWeightTugas[$valueTugas] * $scaleTaskDetail[$valueTugas]);
            } catch (\Throwable $th) {}
        }
        $cw100 = $totals / $valueGetData['scale_task'];
        // dd($tempWeightTugasKey);
        $exam100 = $tempWeightUas;
        $finalScore = (float)($cw100 * (float)$getData[0]['scale_task'] / 100) + ($exam100 * (float)$getData[0]['scale_exam'] / 100);
        
        // $checkScore = MScore::where('int4(min_point)', '<=', $finalScore)
        //                     ->where('int4(max_point)', '>=', $finalScore)
        //                     ->first();
        $checkScore = DB::select("
            SELECT code
            FROM m_score
            WHERE float4(min_point) <= '".(float)$finalScore."'
            AND float4(min_point) <= '".(float)$finalScore."'
        ");
                            
        // if($checkScore == null){
        //     $checkScore = MScore::where('int4(min_point)', '>', $finalScore)
        //                         ->first();
            
        // }

        array_push($dataMhs, [
            'name' => explode('(', $stateMhsName)[0],
            'nim' => $stateMhsNim,
            'kehadiran' => $stateKehadiran,
            'cw100' => number_format($cw100, 2),
            'cw60' => number_format($cw100 * (float)$getData[0]['scale_task'] / 100, 2),
            'exam100' => number_format($exam100, 2),
            'exam40' => number_format($exam100 * (float)$getData[0]['scale_exam'] / 100, 2),
            'final_score' => number_format($finalScore, 2),
            'grade' => $checkScore[0]->code,
            'date' => Carbon::parse($valueGetData['created_at'])->format('Y/m/d'),
        ]);

        $score = array_column($dataMhs, 'final_score');

        array_multisort($score, SORT_DESC, $dataMhs);

        $studentTop3 = [];
        $studentMiddle3 = [];
        $studentBottom3 = [];

        foreach (array_slice($dataMhs, 0, 3) as $key => $value) {
            array_push($studentTop3, [
                'id' => $key + 1,
                'nim' => $value['nim'],
                'name' => $value['name'],
                'nilai' => number_format((float)$value['final_score'], 0),
            ]);
        }

        foreach (array_slice($dataMhs, (count($dataMhs)/2)-3, 3) as $key => $value) {
            array_push($studentMiddle3, [
                'id' => $key + 1,
                'nim' => $value['nim'],
                'name' => $value['name'],
                'nilai' => number_format((float)$value['final_score'], 0),
            ]);
        }

        foreach (array_slice($dataMhs, count($dataMhs)-3, 3) as $key => $value) {
            array_push($studentBottom3, [
                'id' => $key + 1,
                'nim' => $value['nim'],
                'name' => $value['name'],
                'nilai' => number_format((float)$value['final_score'], 0),
            ]);
        }

        $deviationData = [];
        $deviationData['avg_cw60'] = 0;
        $deviationData['avg_cw100'] = 0;
        $deviationData['avg_exam40'] = 0;
        $deviationData['avg_exam100'] = 0;
        $deviationData['avg_final_score'] = 0;
        $tempDeviationData['deviation_cw60'] = 0;
        $tempDeviationData['deviation_cw100'] = 0;
        $tempDeviationData['deviation_exam40'] = 0;
        $tempDeviationData['deviation_exam100'] = 0;
        $tempDeviationData['deviation_final_score'] = 0;
        $tempDeviationData['deviation_cw60'] = [];
        $tempDeviationData['deviation_cw100'] = [];
        $tempDeviationData['deviation_exam40'] = [];
        $tempDeviationData['deviation_exam100'] = [];
        $tempDeviationData['deviation_final_score'] = [];

        $test = 0;
        foreach ($dataMhs as $keyDataMhs => $valueDataMhs) {
            $test += (float)$valueDataMhs['cw60'];
            $deviationData['avg_cw60'] += (float)$valueDataMhs['cw60'];
            $deviationData['avg_cw100'] += (float)$valueDataMhs['cw100'];
            $deviationData['avg_exam40'] += (float)$valueDataMhs['exam40'];
            $deviationData['avg_exam100'] += (float)$valueDataMhs['exam100'];
            $deviationData['avg_final_score'] += (float)$valueDataMhs['final_score'];
            array_push($tempDeviationData['deviation_cw60'], (float)$valueDataMhs['cw60']);
            array_push($tempDeviationData['deviation_cw100'], (float)$valueDataMhs['cw100']);
            array_push($tempDeviationData['deviation_exam40'], (float)$valueDataMhs['exam40']);
            array_push($tempDeviationData['deviation_exam100'], (float)$valueDataMhs['exam100']);
            array_push($tempDeviationData['deviation_final_score'], (float)$valueDataMhs['final_score']);
        }

        $deviationData['avg_cw60'] = (float)number_format($deviationData['avg_cw60']/count($dataMhs), 2);
        $deviationData['avg_cw100'] = (float)number_format($deviationData['avg_cw100']/count($dataMhs), 2);
        $deviationData['avg_exam40'] = (float)number_format($deviationData['avg_exam40']/count($dataMhs), 2);
        $deviationData['avg_exam100'] = (float)number_format($deviationData['avg_exam100']/count($dataMhs), 2);
        $deviationData['avg_final_score'] = (float)number_format($deviationData['avg_final_score']/count($dataMhs), 2);

        $deviationData['deviation_cw60'] = $this->standartDeviation($tempDeviationData['deviation_cw60']);
        $deviationData['deviation_cw100'] = $this->standartDeviation($tempDeviationData['deviation_cw100']);
        $deviationData['deviation_exam40'] = $this->standartDeviation($tempDeviationData['deviation_exam40']);
        $deviationData['deviation_exam100'] = $this->standartDeviation($tempDeviationData['deviation_exam100']);
        $deviationData['deviation_final_score'] = $this->standartDeviation($tempDeviationData['deviation_final_score']);

        return response()->json([
            'table' => $dataMhs,
            'deviation' => $deviationData,
            'rank' => [
                [
                    'id' => 1,
                    'title' => "Student Top", 
                    'data' => $studentTop3
                ],
                [
                    'id' => 2,
                    'title' => "Student Middle",
                    'data' =>  $studentMiddle3
                ],
                [
                    'id' => 3,
                    'title' => "Student Bottom",
                    'data' => $studentBottom3
                ]
            ]
        ]);
    }

    public function indexCplMarkByCW(Request $request)
    {
        $getData = DB::select("
            SELECT m_course_works.name as cwname, m_cpl.code as cplcode, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as weight
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpl.*
                FROM a_mata_kuliah_cpl
                JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                AND a_mata_kuliah.deleted_at IS NULL
            )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
            JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
            JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
            AND a_mata_kuliah.deleted_at IS NULL
            GROUP BY m_course_works.name, m_cpl.code
            ORDER BY m_course_works.name ASC
        ");


        $arrTemp = [];
        $datas = [];
        $stateCw = null;
        $arrCategories = [];
        // dd($getData);
        foreach ($getData as $key => $value) {
            if ($stateCw == null) {
                $stateCw = $value->cwname;

                array_push($arrTemp, [
                    'xAxis' => $value->cplcode,
                    'y' => $value->weight / 100 * 4
                ]);
                array_push($arrCategories, $value->cplcode);
            }else if($stateCw != null){
                if ($stateCw != $value->cwname) {
                    array_push($datas, [
                        'name' => $stateCw,
                        'data' => $arrTemp
                    ]);

                    $stateCw = $value->cwname;
                    $arrTemp = [];

                    array_push($arrTemp, [
                        'xAxis' => $value->cplcode,
                        'y' => $value->weight / 100 * 4
                    ]);
                    array_push($arrCategories, $value->cplcode);
                }else if($stateCw == $value->cwname){
                    array_push($arrTemp, [
                        'xAxis' => $value->cplcode,
                        'y' => $value->weight / 100 * 4
                    ]);
                    array_push($arrCategories, $value->cplcode);
                }
            }
        }
        array_push($datas, [
            'name' => $stateCw,
            'data' => $arrTemp
        ]);

        return response()->json([
            'data_series' => $datas,
            'data_categories' => array_unique($arrCategories)
        ]);
    }

    public function indexCpmkMarkByCW(Request $request)
    {
        $getData = DB::select("
            SELECT m_course_works.name as cwname, m_cpmk.id as cpmkid,
                    SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpmk.weight)) * 4 / COUNT(a_cw_question_cpmk.a_mata_kuliah_cpmk_id) as weight
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
            JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpmk ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpmk.a_cw_question_id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpmk.*
                FROM a_mata_kuliah_cpmk
                JOIN a_mata_kuliah ON a_mata_kuliah_cpmk.a_mata_kuliah_id = a_mata_kuliah.id
                WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                AND a_mata_kuliah.deleted_at IS NULL
            ) a_mata_kuliah_cpmk ON a_cw_question_cpmk.a_mata_kuliah_cpmk_id = a_mata_kuliah_cpmk.id
            JOIN m_cpmk ON a_mata_kuliah_cpmk.cpmk_id = m_cpmk.id
            JOIN a_course_work_questions ON a_cw_question_cpmk.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
            AND a_mata_kuliah.deleted_at IS NULL
            GROUP BY m_course_works.name, m_cpmk.id
            ORDER BY m_course_works.name, m_cpmk.id ASC
        ");

        // dd($getData);
        $arrTemp = [];
        $datas = [];
        $stateCw = null;
        $arrCategories = [];
        $firstCpmk = $getData[0]->cpmkid;
        $allCpmk = [];
        foreach ($getData as $keyGetData => $valueGetData) {
            array_push($allCpmk, $valueGetData->cpmkid);
        }
        $allCpmk = array_unique($allCpmk);
        sort($allCpmk);
        foreach ($getData as $key => $value) {
            if ($stateCw == null) {
                $stateCw = $value->cwname;
                array_push($arrTemp, [
                    'xAxis' => 'CPMK'.(array_search($value->cpmkid, $allCpmk)) + 1,
                    'y' => (float)number_format((float)$value->weight, 1)
                ]);
                array_push($arrCategories, 'CPMK'.(array_search($value->cpmkid, $allCpmk)) + 1);
            }else if($stateCw != null){
                if ($stateCw != $value->cwname) {
                    if (count($arrTemp) < count($allCpmk)) {
                        if ((int)str_replace('CPMK', '', ($arrTemp[0]['xAxis'])) == 1) {
                            $getTotal = count($allCpmk)-count($arrTemp);
                            $getTotalArrTemp = count($arrTemp);
                            for ($i=1; $i <= count($getData)-count($arrTemp); $i++) {
                                array_push($arrTemp, [
                                    'xAxis' => 'CPMK'.($getTotalArrTemp + $i),
                                    'y' => 0
                                ]);
                            }
                        }else{
                            $getTotal = count($allCpmk)-count($arrTemp);
                            $getArrTemp = count($arrTemp);
                            for ($i= $getTotal; $i >= 1; $i--) {
                                array_unshift($arrTemp, [
                                    'xAxis' => 'CPMK'.$i,
                                    'y' => 0
                                ]);
                            }
                        }
                    }

                    array_push($datas, [
                        'name' => $stateCw,
                        'data' => $arrTemp
                    ]);

                    $stateCw = $value->cwname;
                    $arrTemp = [];

                    array_push($arrTemp, [
                        'xAxis' => 'CPMK'.(array_search($value->cpmkid, $allCpmk)) + 1,
                        'y' => (float)number_format((float)$value->weight, 1)
                    ]);
                    array_push($arrCategories, 'CPMK'.(array_search($value->cpmkid, $allCpmk)) + 1);
                }else if($stateCw == $value->cwname){
                    array_push($arrTemp, [
                        'xAxis' => 'CPMK'.(array_search($value->cpmkid, $allCpmk)) + 1,
                        'y' => (float)number_format((float)$value->weight, 1)
                    ]);
                    array_push($arrCategories, 'CPMK'.(array_search($value->cpmkid, $allCpmk)) + 1);
                }
            }
        }

        if (count($arrTemp) < count($allCpmk)) {
            if ((int)str_replace('CPMK', '', ($arrTemp[0]['xAxis'])) == 1) {
                $getTotal = count($allCpmk)-count($arrTemp);
                $getTotalArrTemp = count($arrTemp);
                for ($i=1; $i <= count($getData)-count($arrTemp); $i++) {
                    array_push($arrTemp, [
                        'xAxis' => 'CPMK'.($getTotalArrTemp + $i),
                        'y' => 0
                    ]);
                }
            }else{
                $getTotal = count($allCpmk)-count($arrTemp);
                $getArrTemp = count($arrTemp);
                for ($i= $getTotal; $i >= 1; $i--) {
                    array_unshift($arrTemp, [
                        'xAxis' => 'CPMK'.$i,
                        'y' => 0
                    ]);
                }
            }
        }
        array_push($datas, [
        'name' => $stateCw,
        'data' => $arrTemp
        ]);

        return response()->json([
        'data_series' => $datas,
        'data_categories' => array_unique($arrCategories)
        ]);
    }

    public function indexGradeStatistic(Request $request)
    {
        $getData = AMataKuliah::selectRaw('m_mahasiswa.name as mhsName, m_mahasiswa.nim as mhsNim, a_mata_kuliah_mahasiswa.presence as kehadiran, 
                                            m_course_works.name as cwname, a_cw_question_mhs.weight, m_mahasiswa.created_at,
                                            a_mata_kuliah.scale_task, a_mata_kuliah.scale_exam, a_mata_kuliah.total_task, a_mata_kuliah.scale_task_detail')
                    ->join('a_mata_kuliah_mahasiswa', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_mahasiswa.a_mata_kuliah_id')
                    ->join('a_mahasiswa_program_studies', 'a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id', '=', 'a_mahasiswa_program_studies.id')
                    ->join('m_mahasiswa', 'a_mahasiswa_program_studies.m_mahasiswa_nim', '=', 'm_mahasiswa.nim')
                    ->leftJoin('a_cw_question_mhs', 'a_mata_kuliah_mahasiswa.id', '=', 'a_cw_question_mhs.a_mata_kuliah_mahasiswa_id')
                    ->leftJoin('a_course_work_questions', 'a_cw_question_mhs.a_cw_question_id', '=', 'a_course_work_questions.id')
                    ->leftJoin('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                    ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                    ->where('a_mata_kuliah.deleted_at', null)
                    ->get();

        $getScore = MScore::orderBy('id', 'ASC')->get();

        $dataMhs = [];
        $stateMhsName = null;
        $stateMhsNim = null;
        $stateKehadiran = null;
        $stateCw = null;
        $stateCwDetail = null;
        $tempWeightTugas = [];
        $tempWeightTugasKey = [];
        $tempWeightUas = 0;
        $totalWeightTugas = 0;
        $totalWeightUas = 0;
        $scaleTaskDetail = null;
        foreach ($getData as $keyGetData => $valueGetData) {
            $scaleTaskDetail = (array)json_decode($valueGetData['scale_task_detail']);
            // dd($scaleTaskDetail[$valueGetData['cwname']]);
            if ($stateMhsName == null) {
                $stateMhsName = $valueGetData['mhsname'];
                $stateMhsNim = $valueGetData['mhsnim'];
                $stateKehadiran = $valueGetData['kehadiran'];
                $stateCw = explode(' ', $valueGetData['cwname'])[0];
                $stateCwDetail = $valueGetData['cwname'];
                
                if (explode(' ', $valueGetData['cwname'])[0] == 'Tugas') {
                    if (! array_key_exists($valueGetData['cwname'],$tempWeightTugas)) {
                        $tempWeightTugas[$valueGetData['cwname']] = 0;
                        array_push($tempWeightTugasKey, $valueGetData['cwname']);
                    }
                    $tempWeightTugas[$valueGetData['cwname']] += (float)$valueGetData['weight'];
                    $totalWeightTugas += 1;
                }else if($valueGetData['cwname'] == 'UAS'){
                    $tempWeightUas += (float)$valueGetData['weight'];
                    $totalWeightUas += 1;
                }
                // dd($totalWeightTugas);
            }else{
                if ($valueGetData['mhsname'] != $stateMhsName) {
                    $totals = 0;
                    foreach ($tempWeightTugasKey as $keyTugas => $valueTugas) {
                        try {
                            $totals += ((float)$tempWeightTugas[$valueTugas] * $scaleTaskDetail[$valueTugas]);
                        } catch (\Throwable $th) {}
                    }
                    $cw100 = $totals / $valueGetData['scale_task'];
                    $exam100 = $tempWeightUas;
                    $finalScore = ($cw100 * (float)$valueGetData['scale_task'] / 100) + ($exam100 * (float)$valueGetData['scale_exam'] / 100);

                    // $checkScore = MScore::where('int4(min_point)', '<', $finalScore)
                    //                     ->where('int4(max_point)', '>', $finalScore)
                    //                     ->first();

                    $checkScore = DB::select("
                                        SELECT code
                                        FROM m_score
                                        WHERE float4(min_point) < '".(float)$finalScore."'
                                        AND float4(max_point) >= '".(float)$finalScore."'
                                    ");
                    $getCode = null;
                    try {
                        $getCode = $checkScore[0]->code;
                    } catch (\Throwable $th) {
                        //throw $th;
                    }
                    
                    // dd(number_format($cw100 * (float)$valueGetData['scale_task'] / 100,2));
                    array_push($dataMhs, [
                        'name' => explode('(', $stateMhsName)[0],
                        'nim' => $stateMhsNim,
                        'kehadiran' => $stateKehadiran,
                        'cw100' => number_format($cw100, 2),
                        'cw60' => number_format($cw100 * (float)$valueGetData['scale_task'] / 100,2),
                        'exam100' => number_format($exam100, 2),
                        'exam40' => number_format($exam100 * (float)$valueGetData['scale_exam'] / 100, 2),
                        'final_score' => number_format($finalScore, 2),
                        'grade' => $getCode,
                        'date' => Carbon::parse($valueGetData['created_at'])->format('Y/m/d'),
                    ]);

                    $tempWeightTugas = [];
                    $tempWeightTugasKey = [];
                    $tempWeightUas = 0;
                    $totalWeightTugas = 0;
                    $totalWeightUas = 0;
                    $stateMhsName = $valueGetData['mhsname'];
                    $stateMhsNim = $valueGetData['mhsnim'];
                    $stateKehadiran = $valueGetData['kehadiran'];
                    $stateCw = explode(' ', $valueGetData['cwname'])[0];
                    $stateCwDetail = $valueGetData['cwname'];
                    
                    if (explode(' ', $valueGetData['cwname'])[0] == 'Tugas') {
                        if (! array_key_exists($valueGetData['cwname'],$tempWeightTugas)) {
                            $tempWeightTugas[$valueGetData['cwname']] = 0;
                            array_push($tempWeightTugasKey, $valueGetData['cwname']);
                        }
                        $tempWeightTugas[$valueGetData['cwname']] += (float)$valueGetData['weight'];
                        $totalWeightTugas += 1;
                    }else if($valueGetData['cwname'] == 'UAS'){
                        $tempWeightUas += (float)$valueGetData['weight'];
                        $totalWeightUas += 1;
                    }
                }else{
                    if (explode(' ', $valueGetData['cwname'])[0] == 'Tugas') {
                        if (! array_key_exists($valueGetData['cwname'],$tempWeightTugas)) {
                            $tempWeightTugas[$valueGetData['cwname']] = 0;
                            array_push($tempWeightTugasKey, $valueGetData['cwname']);
                        }
                        $tempWeightTugas[$valueGetData['cwname']] += (float)$valueGetData['weight'];
                        $totalWeightTugas += 1;
                    }else if($valueGetData['cwname'] == 'UAS'){
                        $tempWeightUas += (float)$valueGetData['weight'];
                        $totalWeightUas += 1;
                    }
                }
            }
        }
        $totals = 0;
        foreach ($tempWeightTugasKey as $keyTugas => $valueTugas) {
            try {
                $totals += ((float)$tempWeightTugas[$valueTugas] * $scaleTaskDetail[$valueTugas]);
            } catch (\Throwable $th) {}
        }
        $cw100 = $totals / $valueGetData['scale_task'];
        // dd($tempWeightTugasKey);
        $exam100 = $tempWeightUas;
        $finalScore = (float)($cw100 * (float)$getData[0]['scale_task'] / 100) + ($exam100 * (float)$getData[0]['scale_exam'] / 100);
        
        // $checkScore = MScore::where('int4(min_point)', '<=', $finalScore)
        //                     ->where('int4(max_point)', '>=', $finalScore)
        //                     ->first();
        $checkScore = DB::select("
            SELECT code, max_point, min_point
            FROM m_score
            WHERE float4(min_point) <= '".(float)$finalScore."'
            AND float4(min_point) <= '".(float)$finalScore."'
        ");
                            
        // if($checkScore == null){
        //     $checkScore = MScore::where('int4(min_point)', '>', $finalScore)
        //                         ->first();
            
        // }

        array_push($dataMhs, [
            'name' => explode('(', $stateMhsName)[0],
            'nim' => $stateMhsNim,
            'kehadiran' => $stateKehadiran,
            'cw100' => number_format($cw100, 2),
            'cw60' => number_format($cw100 * (float)$getData[0]['scale_task'] / 100, 2),
            'exam100' => number_format($exam100, 2),
            'exam40' => number_format($exam100 * (float)$getData[0]['scale_exam'] / 100, 2),
            'final_score' => number_format($finalScore, 2),
            'grade' => $checkScore[0]->code,
            'date' => Carbon::parse($valueGetData['created_at'])->format('Y/m/d'),
        ]);

        // dd((int)$getData[0]['scale_task']);

        $dataSeries = [];
        $dataCategories = [];
        $countGrade = 0;

        foreach ($getScore as $keyGetScore => $valueGetScore) {
            array_push($dataCategories, $valueGetScore['code']);
            foreach ($dataMhs as $keyDataMhs => $valueDataMhs) {
                if ($valueDataMhs['final_score'] >= $valueGetScore['min_point'] && $valueDataMhs['final_score'] <= $valueGetScore['max_point']) {
                    $countGrade += 1;
                }
            }
            array_push($dataSeries, $countGrade);
            $countGrade = 0;
        }

        // return response()->json($dataMhs);
        return response()->json([
            'data_series' => $dataSeries,
            'data_categories' => $dataCategories
        ]);
    }

    public function indexRecapAssessmentByCompetenciesStatistic(Request $request)
    {
        $getData = [];
        
        $query0 = "";
        $query1 = "";
        $query2 = "";
        
        if ($request->id_dosen || $request->id_mahasiswa || $request->id_mata_kuliah) {
            if ($request->tahun && $request->semester) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
                $query0 .= "  AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }
            } else if ($request->tahun) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }

            }else if ($request->semester){
                $query0 = " AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
                $query1 = "";
                $query2 = "";

                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }

            }else{
                $query1 = "";
                $query2 = "";

                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }
            }
        }else{
            if ($request->tahun && $request->semester) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
                $query0 .= "  AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
            } else if ($request->tahun) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
            } else if($request->semester){
                $query0 = " AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
            }
        }

        $arrMatkulGetData = "
            SELECT 
                competenciesname, AVG(scale100) as scale100, AVG(scale4) as scale4
            FROM (   
                SELECT 
                    idcpl as id, code, competenciesname, courseworkcpl, questioncpl, AVG(float4(weightmhs) / float4(weightcpl) * 100) scale100,
                    AVG(float4(weightmhs) / float4(weightcpl) * 4) as scale4
                FROM (
                    SELECT amk.id as idcpl, mc.code, m_competencies.name as competenciesname, mcwcpl.name as courseworkcpl, mqcpl.name as questioncpl, acqcpl.weight as weightcpl
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    JOIN m_cpl mc ON amkcpl.cpl_id = mc.id
                    JOIN a_cpl_competencies acc ON amkcpl.id = acc.a_mata_kuliah_cpl_id
                    JOIN a_mata_kuliah_competencies amkc ON acc.a_mata_kuliah_competencies_id = amkc.id
                    JOIN m_competencies ON amkc.competencies_id = m_competencies.id
                    JOIN a_cw_question_cpl acqcpl ON amkcpl.id = acqcpl.a_mata_kuliah_cpl_id
                    JOIN a_course_work_questions acwqcpl ON acqcpl.a_cw_question_id = acwqcpl.id
                    JOIN m_course_works mcwcpl ON acwqcpl.course_work_id = mcwcpl.id
                    JOIN m_questions mqcpl ON acwqcpl.question_id = mqcpl.id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    ".$query0."
                    ".$query1."
                    GROUP BY mcwcpl.id, mqcpl.id, amk.id, acqcpl.weight, mc.code, m_competencies.name
                    ORDER BY amk.id, mcwcpl.id, mqcpl.id
                ) main
                JOIN (
                    SELECT amk.id as idmhs, mcw.name as courseworkmhs, mq.name as questionmhs, acqmhs.weight as weightmhs
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_mahasiswa amkmhs ON amk.id = amkmhs.a_mata_kuliah_id
                    JOIN a_mahasiswa_program_studies amps ON amkmhs.a_mahasiswa_program_study_id = amps.id
                    JOIN m_mahasiswa mm ON amps.m_mahasiswa_nim = mm.nim
                    JOIN a_cw_question_mhs acqmhs ON amkmhs.id = acqmhs.a_mata_kuliah_mahasiswa_id
                    JOIN a_course_work_questions acwq ON acqmhs.a_cw_question_id = acwq.id
                    JOIN m_course_works mcw ON acwq.course_work_id = mcw.id
                    JOIN m_questions mq ON acwq.question_id = mq.id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    ".$query0."
                    ".$query2."
                    GROUP BY mcw.id, mq.id, amk.id, acqmhs.weight
                    ORDER BY amk.id, mcw.id, mq.id
                    ) secondary ON main.idcpl = secondary.idmhs AND main.courseworkcpl = secondary.courseworkmhs AND main.questioncpl = secondary.questionmhs
                GROUP BY idcpl, courseworkcpl, questioncpl, code, competenciesname
            ) main2
            GROUP BY competenciesname
            ORDER BY competenciesname ASC
        ";

        $getDataTemp = DB::select(DB::raw($arrMatkulGetData));

        $stateCode = null;
        $getData['keys'] = [];
        foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
            array_push($getData['keys'], $valueGetDataTemp->competenciesname);

            $getData[$valueGetDataTemp->competenciesname]['datacplrate100'] = (float)$valueGetDataTemp->scale100;
            $getData[$valueGetDataTemp->competenciesname]['datacplrate4'] = (float)$valueGetDataTemp->scale4;
            $getData[$valueGetDataTemp->competenciesname]['count'] = 1;

        }

        $dataSeries100 = [0];
        $dataSeries4 = [0];
        $dataCategories = [''];
        $dataSeriesCpls = [];
        $dataCategoriesCpls = [];
        foreach ($getData['keys'] as $key => $value) {
            array_push($dataSeries100, (float)number_format($getData[$value]['datacplrate100'], 2));
            array_push($dataSeries4, (float)number_format($getData[$value]['datacplrate4'], 2));
            array_push($dataCategories, $value);

            array_push($dataSeriesCpls, $getData[$value]['datacplrate4']);
            array_push($dataCategoriesCpls, $value);
        }
        array_push($dataSeries100, 0);
        array_push($dataSeries4, 0);
        array_push($dataCategories, '');

        return response()->json([
            "id" => 1,
            "data_categories" => $dataCategories,
            "data_series" => [
                [
                    "name" => "Rate_100",
                    "data" => $dataSeries100
                ],
                [
                    "name" => "Rate_4",
                    "data" => $dataSeries4
                ]
            ],
            'data_series_cpls' => $dataSeriesCpls,
            'data_categories_cpls' => $dataCategoriesCpls
        ]);
    }

    public function indexRecapAssessmentByCplStatistic(Request $request)
    {
        $getData = [];
        
        $query0 = "";
        $query1 = "";
        $query2 = "";
        
        if ($request->id_dosen || $request->id_mahasiswa || $request->id_mata_kuliah) {
            if ($request->tahun && $request->semester) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
                $query0 .= "  AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }
            } else if ($request->tahun) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }

            }else if ($request->semester){
                $query0 = " AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
                $query1 = "";
                $query2 = "";

                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }

            }else{
                $query1 = "";
                $query2 = "";

                if ($request->id_mata_kuliah) {
                    $query1 = " AND amk.id = ".$request->id_mata_kuliah."";
                    $query2 = " AND amk.id = ".$request->id_mata_kuliah."";
                    
                }else if ($request->id_mahasiswa) {
                    $query2 = " AND mm.nim LIKE '%".$request->id_mahasiswa."%'";
                }else if ($request->id_dosen) {
                    $query1 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                    $query2 = " AND amk.dosen_nidn LIKE '%".$request->id_dosen."%'";
                }
            }
        }else{
            if ($request->tahun && $request->semester) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
                $query0 .= "  AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
            } else if ($request->tahun) {
                $query0 = " AND amk.year LIKE '%".$request->tahun."%'";
            } else if($request->semester){
                $query0 = " AND amk.semester IN (".((strtolower($request->semester) == 'ganjil')? implode(',', [1,3,5,7,9,11]) : implode(',', [2,4,6,8,10])).")";
            }
        }

        $arrMatkulGetData = "
            SELECT 
                code, AVG(scale100) as scale100, AVG(scale4) as scale4
            FROM (   
                SELECT 
                    idcpl as id, code, courseworkcpl, questioncpl, AVG(float4(weightmhs) / float4(weightcpl) * 100) as scale100,
                    AVG(float4(weightmhs) / float4(weightcpl) * 4) as scale4
                FROM (   
                    SELECT amk.id as idcpl, mc.code, mcwcpl.name as courseworkcpl, mqcpl.name as questioncpl, acqcpl.weight as weightcpl
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    JOIN m_cpl mc ON amkcpl.cpl_id = mc.id
                    JOIN a_cw_question_cpl acqcpl ON amkcpl.id = acqcpl.a_mata_kuliah_cpl_id
                    JOIN a_course_work_questions acwqcpl ON acqcpl.a_cw_question_id = acwqcpl.id
                    JOIN m_course_works mcwcpl ON acwqcpl.course_work_id = mcwcpl.id
                    JOIN m_questions mqcpl ON acwqcpl.question_id = mqcpl.id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    ".$query0."
                    ".$query1."
                    GROUP BY mcwcpl.id, mqcpl.id, amk.id, acqcpl.weight, mc.code
                    ORDER BY amk.id, mcwcpl.id, mqcpl.id
                ) main
                JOIN (
                    SELECT amk.id as idmhs, mm.nim, mcw.name as courseworkmhs, mq.name as questionmhs, acqmhs.weight as weightmhs
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_mahasiswa amkmhs ON amk.id = amkmhs.a_mata_kuliah_id
                    JOIN a_mahasiswa_program_studies amps ON amkmhs.a_mahasiswa_program_study_id = amps.id
                    JOIN m_mahasiswa mm ON amps.m_mahasiswa_nim = mm.nim
                    JOIN a_cw_question_mhs acqmhs ON amkmhs.id = acqmhs.a_mata_kuliah_mahasiswa_id
                    JOIN a_course_work_questions acwq ON acqmhs.a_cw_question_id = acwq.id
                    JOIN m_course_works mcw ON acwq.course_work_id = mcw.id
                    JOIN m_questions mq ON acwq.question_id = mq.id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    ".$query0."
                    ".$query2."
                    GROUP BY mcw.id, mq.id, amk.id, acqmhs.weight, mm.nim
                    ORDER BY amk.id, mcw.id, mq.id
                ) secondary ON main.idcpl = secondary.idmhs AND main.courseworkcpl = secondary.courseworkmhs AND main.questioncpl = secondary.questionmhs
                GROUP BY idcpl, courseworkcpl, questioncpl, code
            ) main2
            GROUP BY code
            ORDER BY code ASC
        ";

        $getDataTemp = DB::select(DB::raw($arrMatkulGetData));

        $stateCode = null;
        $getData['keys'] = [];
        foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
            array_push($getData['keys'], $valueGetDataTemp->code);

            $getData[$valueGetDataTemp->code]['datacplrate100'] = (float)$valueGetDataTemp->scale100;
            $getData[$valueGetDataTemp->code]['datacplrate4'] = (float)$valueGetDataTemp->scale4;
            $getData[$valueGetDataTemp->code]['count'] = 1;

        }

        $dataSeries100 = [0];
        $dataSeries4 = [0];
        $dataCategories = [''];
        $dataSeriesCpls = [];
        $dataCategoriesCpls = [];
        foreach ($getData['keys'] as $key => $value) {
            array_push($dataSeries100, (float)number_format($getData[$value]['datacplrate100'], 2));
            array_push($dataSeries4, (float)number_format($getData[$value]['datacplrate4'], 2));
            array_push($dataCategories, $value);

            array_push($dataSeriesCpls, $getData[$value]['datacplrate4']);
            array_push($dataCategoriesCpls, $value);
        }
        array_push($dataSeries100, 0);
        array_push($dataSeries4, 0);
        array_push($dataCategories, '');

        return response()->json([
            "id" => 1,
            "data_categories" => $dataCategories,
            "data_series" => [
                [
                    "name" => "Rate_100",
                    "data" => $dataSeries100
                ],
                [
                    "name" => "Rate_4",
                    "data" => $dataSeries4
                ]
            ],
            'data_series_cpls' => $dataSeriesCpls,
            'data_categories_cpls' => $dataCategoriesCpls
        ]);
    }

    public function indexStudentMarkByCpmk(Request $request)
    {
        $getData = DB::select("
            SELECT m_mahasiswa.name, m_mahasiswa.nim, m_course_works.name as cwname, a_mata_kuliah_cpmk.id as cpmkid, a_mata_kuliah_cpmk.id as matkulcpmkid, 
                    SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpmk.weight)) * 100 / COUNT(a_cw_question_cpmk.a_mata_kuliah_cpmk_id) as cpmks
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
            JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpmk ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpmk.a_cw_question_id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpmk.*
                FROM a_mata_kuliah_cpmk
                JOIN a_mata_kuliah ON a_mata_kuliah_cpmk.a_mata_kuliah_id = a_mata_kuliah.id
                WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                AND a_mata_kuliah.deleted_at IS NULL
            )a_mata_kuliah_cpmk ON a_cw_question_cpmk.a_mata_kuliah_cpmk_id = a_mata_kuliah_cpmk.id
            JOIN m_cpmk ON a_mata_kuliah_cpmk.cpmk_id = m_cpmk.id
            JOIN a_course_work_questions ON a_cw_question_cpmk.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
            AND a_mata_kuliah.deleted_at IS NULL
            GROUP BY m_mahasiswa.name, m_mahasiswa.nim, m_course_works.name, m_cpmk.id, a_mata_kuliah_cpmk.id
            ORDER BY m_course_works.name ASC, m_mahasiswa.name ASC, a_mata_kuliah_cpmk.id ASC
        ");

        $tempCpmk = [
            [
                'id' => 1,
                'field' => 'nim',
                'name' => 'NIM'
            ],[
                'id' => 2,
                'field' => 'name',
                'name' => 'Nama Mahasiswa'
            ]
        ];
        $tempStateCpmk = [];
        $tempDataStudent = [];
        $initTempDataStudent = [];
        $tempDataCw = [];
        $stateCw = null;
        $stateCpmk = null;
        $stateMhs = null;

        $getCpmk = AMataKuliahCpmk::selectRaw('a_mata_kuliah_cpmk.cpmk_id, a_cw_question_cpmk.weight')
                                        ->join('a_cw_question_cpmk', 'a_mata_kuliah_cpmk.id', '=' ,'a_cw_question_cpmk.a_mata_kuliah_cpmk_id')
                                        ->join('a_mata_kuliah', 'a_mata_kuliah_cpmk.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                        ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->first();

        $allCpmk = [];
        $arrListTitle = [];
        $arrDataDeviation = [];
        foreach ($getData as $keyGetData => $valueGetData) {
            array_push($allCpmk, $valueGetData->cpmkid);
        }
        $allCpmk = array_unique($allCpmk);

        sort($allCpmk);
        foreach ($allCpmk as $keyAllCpmk => $valueAllCpmk) {
            array_push($arrListTitle, $keyAllCpmk + 1);
        }

        foreach ($getData as $key => $value) {
            if ($stateCw != $value->cwname && $stateCw != null) {

                $checkStateCw = explode(' ',$stateCw)[0];
                $getUniqueStateCpmk = array_unique($tempStateCpmk);
                // sort($getUniqueStateCpmk);
                foreach ($getUniqueStateCpmk as $keyStateCpmk => $valueStateCpmk) {
                    array_push($tempCpmk, [
                        'id' => count($tempCpmk) + 1,
                        'field' => 'cpmk'.$valueStateCpmk,
                        'name' => 'CPMK'.$valueStateCpmk
                    ]);
                }

                array_push($tempDataCw, [
                    'id' => (($checkStateCw == 'Tugas') ? 'cw_'.explode(' ',$stateCw)[1] : 'cw_uas'),
                    'title' => (($checkStateCw == 'Tugas') ? 'COURSE WORK '.explode(' ',$stateCw)[1] . ' | TUGAS ' . explode(' ',$stateCw)[1] : 'EXAM | UAS'),
                    'list_header' => $tempCpmk,
                    'data_student' => $initTempDataStudent
                ]);

                $tempStateCpmk = [];
                
                $tempCpmk = [
                    [
                        'id' => 1,
                        'field' => 'nim',
                        'name' => 'NIM'
                    ],[
                        'id' => 2,
                        'field' => 'name',
                        'name' => 'Nama Mahasiswa'
                    ]
                ];

                $stateCw = $value->cwname;

                $stateCpmk = $value->cpmkid;
                $stateMhs = $value->nim;


                $initTempDataStudent = [];
                
                $tempDataStudent = [
                    'name' => $value->name, 
                    'nim' => $value->nim
                ];
                
                $tempDataStudent['cpmk'.((int)array_search($value->cpmkid, $allCpmk) + 1)] = number_format($value->cpmks, 2);
            }else if ($stateCw == $value->cwname) {
                
                if ($stateMhs != $value->nim) {
                    array_push($initTempDataStudent, $tempDataStudent);
                      
                    $tempDataStudent = [
                        'name' => $value->name, 
                        'nim' => $value->nim
                    ];
                    $tempDataStudent['cpmk'.((int)array_search($value->cpmkid, $allCpmk) + 1)] = number_format($value->cpmks, 2);
                    $stateMhs = $value->nim;
                }else{
                    $tempDataStudent['cpmk'.((int)array_search($value->cpmkid, $allCpmk) + 1)] = number_format($value->cpmks, 2);
                }

                $stateCw = $value->cwname;

                $stateCpmk = $value->cpmkid;

                array_push($tempStateCpmk, (int)array_search($value->cpmkid, $allCpmk) + 1);

            }else if ($stateCw == null){

                $stateCw = $value->cwname;

                $stateMhs = $value->nim;
                $stateCpmk = $value->cpmkid;
                
                array_push($tempStateCpmk, (int)array_search($value->cpmkid, $allCpmk) + 1);

                $tempDataStudent = [
                    'name' => $value->name, 
                    'nim' => $value->nim
                ];
                $tempDataStudent['cpmk'.((int)array_search($value->cpmkid, $allCpmk) + 1)] = number_format($value->cpmks, 2);
            }
        }
        $checkStateCw = explode(' ',$stateCw)[0];

        $getUniqueStateCpmk = array_unique($tempStateCpmk);
        sort($getUniqueStateCpmk);
        foreach ($getUniqueStateCpmk as $keyStateCpmk => $valueStateCpmk) {
            array_push($tempCpmk, [
                'id' => count($tempCpmk) + 1,
                'field' => 'cpmk'.$valueStateCpmk,
                'name' => 'CPMK'.$valueStateCpmk
            ]);
        }

        array_push($tempDataCw, [
            'id' => (($checkStateCw == 'Tugas') ? 'cw_'.explode(' ',$stateCw)[1] : 'cw_uas'),
            'title' => (($checkStateCw == 'Tugas') ? 'COURSE WORK '.explode(' ',$stateCw)[1] . ' | TUGAS ' . explode(' ',$stateCw)[1] : 'EXAM | UAS'),
            'list_header' => $tempCpmk,
            'data_student' => $initTempDataStudent
        ]);

        foreach ($tempDataCw as $keyTempDataCw => $valueTempDataCw) {
            $arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]] = [];
            foreach ($valueTempDataCw['data_student'] as $keyDataStudent => $valueDataStudent) {
                foreach ($arrListTitle as $keyListTitle => $valueListTitle) {
                    try {
                        $tempData = null;
                        try {
                            $tempData = (float)$valueDataStudent['cpmk'.$valueListTitle];
                        } catch (\Throwable $th) {
                            
                        }
                        array_push($arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle], (float)$tempData);
                    } catch (\Throwable $th) {
                        $arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle] = [];
                    }
                }

            }
            // dd($arrListTitle);
            foreach ($arrListTitle as $keyListTitle => $valueListTitle) {
                $arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle] = $this->standartDeviation($arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle]);
            }
        }
        
        $listTitle = [
            [
                'id' => 1,
                'field' => 'name',
                'name' => 'Name'
            ]
        ];
        
        $listHeader = [
            [
                'id' => 1,
                'field' => 'avg',
                'name' => 'Average Total'
            ]
        ];

        foreach ($arrListTitle as $keyListTitle => $valueListTitle) {
            array_push($listTitle, [
                'id' => $keyListTitle + 2,
                'field' => 'cpmk'.$valueListTitle,
                'name' => 'CPMK'.$valueListTitle
            ]);
        }

        $dataDeviations = [];
        foreach ($arrDataDeviation as $keyDataDeviation => $valueDataDeviation) {
            $tempDataDeviations = [];
            if (count($tempDataDeviations) == 0) {
                $tempDataDeviations = [
                    'name' => $keyDataDeviation
                ];
            }

            foreach ($arrListTitle as $keyArrListTitle => $valueArrListTitle) {
                $tempDataDeviations['cpmk'.$valueArrListTitle] = $valueDataDeviation[$valueArrListTitle];
            }

            array_push($dataDeviations, $tempDataDeviations);
        }

        $deviation = [
            'id' => 'cw_cpmk_1',
            'title' => 'STANDARD DEVIATION CPMK',
            'list_headers' => $listTitle,
            'data' => $dataDeviations
        ];

        return response()->json([
            'table' => $tempDataCw,
            'deviation' => $deviation
        ]);
    }

    public function indexStudentMarkByCpl(Request $request)
    {
        $getData = DB::select("
            SELECT m_mahasiswa.name, m_mahasiswa.nim, m_course_works.name as cwname, m_cpl.code as code,
                    SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as cpls
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
            JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpl.*
                FROM a_mata_kuliah_cpl
                JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                AND a_mata_kuliah.deleted_at IS NULL
            )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
            JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
            JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
            AND a_mata_kuliah.deleted_at IS NULL
            GROUP BY m_mahasiswa.name, m_mahasiswa.nim, m_course_works.name, m_cpl.id, a_mata_kuliah_cpl.id
            ORDER BY m_course_works.name ASC, m_mahasiswa.name ASC, a_mata_kuliah_cpl.id ASC
        ");

        $tempCpl = [
            [
                'id' => 1,
                'field' => 'nim',
                'name' => 'NIM'
            ],[
                'id' => 2,
                'field' => 'name',
                'name' => 'Nama Mahasiswa'
            ]
        ];
        $tempStateCpl = [];
        $tempDataStudent = [];
        $initTempDataStudent = [];
        $tempDataCw = [];
        $stateCw = null;
        $stateCpl = null;
        $stateMhs = null;

        $allCpl = [];
        $arrListTitle = [];
        $arrDataDeviation = [];
        foreach ($getData as $keyGetData => $valueGetData) {
            array_push($allCpl, $valueGetData->code);
        }
        $allCpl = array_unique($allCpl);

        sort($allCpl);
        foreach ($allCpl as $keyAllCpl => $valueAllCpmk) {
            array_push($arrListTitle, $valueAllCpmk);
        }

        foreach ($getData as $key => $value) {
            if ($stateCw != $value->cwname && $stateCw != null) {

                $checkStateCw = explode(' ',$stateCw)[0];
                $getUniqueStateCpmk = array_unique($tempStateCpl);
                // sort($getUniqueStateCpmk);
                foreach ($getUniqueStateCpmk as $keyStateCpmk => $valueStateCpl) {
                    array_push($tempCpl, [
                        'id' => count($tempCpl) + 1,
                        'field' => 'cpmk'.$valueStateCpl,
                        'name' => 'CPMK'.$valueStateCpl
                    ]);
                }

                array_push($tempDataCw, [
                    'id' => (($checkStateCw == 'Tugas') ? 'cw_'.explode(' ',$stateCw)[1] : 'cw_uas'),
                    'title' => (($checkStateCw == 'Tugas') ? 'COURSE WORK '.explode(' ',$stateCw)[1] . ' | TUGAS ' . explode(' ',$stateCw)[1] : 'EXAM | UAS'),
                    'list_header' => $tempCpl,
                    'data_student' => $initTempDataStudent
                ]);

                $tempStateCpl = [];
                
                $tempCpl = [
                    [
                        'id' => 1,
                        'field' => 'nim',
                        'name' => 'NIM'
                    ],[
                        'id' => 2,
                        'field' => 'name',
                        'name' => 'Nama Mahasiswa'
                    ]
                ];

                $stateCw = $value->cwname;

                $stateCpl = $value->code;
                $stateMhs = $value->nim;


                $initTempDataStudent = [];
                
                $tempDataStudent = [
                    'name' => $value->name, 
                    'nim' => $value->nim
                ];
                
                $tempDataStudent[$value->code] = number_format($value->cpls, 2);
            }else if ($stateCw == $value->cwname) {
                
                if ($stateMhs != $value->nim) {
                    array_push($initTempDataStudent, $tempDataStudent);
                      
                    $tempDataStudent = [
                        'name' => $value->name, 
                        'nim' => $value->nim
                    ];
                    $tempDataStudent[$value->code] = number_format($value->cpls, 2);
                    $stateMhs = $value->nim;
                }else{
                    $tempDataStudent[$value->code] = number_format($value->cpls, 2);
                }

                $stateCw = $value->cwname;

                $stateCpmk = $value->code;

                array_push($tempStateCpl, $value->code);

            }else if ($stateCw == null){

                $stateCw = $value->cwname;

                $stateMhs = $value->nim;
                $stateCpmk = $value->code;
                
                array_push($tempStateCpl, $value->code);

                $tempDataStudent = [
                    'name' => $value->name, 
                    'nim' => $value->nim
                ];
                $tempDataStudent[$value->code] = number_format($value->cpls, 2);
            }
        }
        $checkStateCw = explode(' ',$stateCw)[0];

        $getUniqueStateCpl = array_unique($tempStateCpl);
        sort($getUniqueStateCpl);
        foreach ($getUniqueStateCpl as $keyStateCpl => $valueStateCpl) {
            array_push($tempCpl, [
                'id' => count($tempCpl) + 1,
                'field' => $valueStateCpl,
                'name' => $valueStateCpl
            ]);
        }

        array_push($tempDataCw, [
            'id' => (($checkStateCw == 'Tugas') ? 'cw_'.explode(' ',$stateCw)[1] : 'cw_uas'),
            'title' => (($checkStateCw == 'Tugas') ? 'COURSE WORK '.explode(' ',$stateCw)[1] . ' | TUGAS ' . explode(' ',$stateCw)[1] : 'EXAM | UAS'),
            'list_header' => $tempCpl,
            'data_student' => $initTempDataStudent
        ]);

        foreach ($tempDataCw as $keyTempDataCw => $valueTempDataCw) {
            $arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]] = [];
            foreach ($valueTempDataCw['data_student'] as $keyDataStudent => $valueDataStudent) {
                foreach ($arrListTitle as $keyListTitle => $valueListTitle) {
                    try {
                        $tempData = null;
                        try {
                            $tempData = (float)$valueDataStudent[$valueListTitle];
                        } catch (\Throwable $th) {
                            
                        }
                        array_push($arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle], (float)$tempData);
                    } catch (\Throwable $th) {
                        $arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle] = [];
                    }
                }

            }
            // dd($arrListTitle);
            foreach ($arrListTitle as $keyListTitle => $valueListTitle) {
                $arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle] = $this->standartDeviation($arrDataDeviation[explode(' | ', $valueTempDataCw['title'])[1]][$valueListTitle]);
            }
        }
        
        $listTitle = [
            [
                'id' => 1,
                'field' => 'name',
                'name' => 'Name'
            ]
        ];

        foreach ($arrListTitle as $keyListTitle => $valueListTitle) {
            array_push($listTitle, [
                'id' => $keyListTitle + 2,
                'field' => $valueListTitle,
                'name' => $valueListTitle
            ]);
        }

        $dataDeviations = [];
        foreach ($arrDataDeviation as $keyDataDeviation => $valueDataDeviation) {
            $tempDataDeviations = [];
            if (count($tempDataDeviations) == 0) {
                $tempDataDeviations = [
                    'name' => $keyDataDeviation
                ];
            }

            foreach ($arrListTitle as $keyArrListTitle => $valueArrListTitle) {
                $tempDataDeviations[$valueArrListTitle] = $valueDataDeviation[$valueArrListTitle];
            }

            array_push($dataDeviations, $tempDataDeviations);
        }

        $deviation = [
            'id' => 'cw_cpl_1',
            'title' => 'STANDARD DEVIATION CPL',
            'list_headers' => $listTitle,
            'data' => $dataDeviations
        ];

        return response()->json([
            'table' => $tempDataCw,
            'deviation' => $deviation
        ]);
    }

    public function indexStudentDetailChartCompetenciesStatistic(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getUniqueCode = AUserProgramStudy::selectRaw('a_mata_kuliah.unique_code')
                                        ->join('a_mata_kuliah', 'a_user_program_studies.program_study_id', '=', 'a_mata_kuliah.master_id')
                                        ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                        ->get();

        $arrMatkulGetData = null;
        $arrMatkulGetDataFinal = null;
        foreach ($getUniqueCode as $keyUniqueCode => $valueUniqueCode) {
            $arrMatkulGetData .= "
                SELECT  m_competencies.name, m_cpl.code as code, a_mata_kuliah.unique_code, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
                FROM a_mata_kuliah
                JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
                JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
                JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
                LEFT JOIN (
                    SELECT a_mata_kuliah_cpl.*
                    FROM a_mata_kuliah_cpl
                    JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                    JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                    JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
                    WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                    AND a_mahasiswa_program_studies.m_mahasiswa_nim LIKE '%".str_replace(' ', '', $request->nim)."%'
                )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
                JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
                JOIN a_cpl_competencies ON a_mata_kuliah_cpl.id = a_cpl_competencies.a_mata_kuliah_cpl_id
                JOIN a_mata_kuliah_competencies ON a_cpl_competencies.a_mata_kuliah_competencies_id = a_mata_kuliah_competencies.id
                JOIN m_competencies ON a_mata_kuliah_competencies.competencies_id = m_competencies.id
                JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
                JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
                JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
                WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                AND a_mahasiswa_program_studies.m_mahasiswa_nim LIKE '%".str_replace(' ', '', $request->nim)."%'
                AND a_mata_kuliah.deleted_at IS NULL
                GROUP BY a_mata_kuliah.unique_code, m_cpl.code, m_competencies.name
            ";

            if ($keyUniqueCode < count($getUniqueCode) - 1) {
                $arrMatkulGetData .= " UNION ";
            }else{
                $arrMatkulGetDataFinal = "
                    SELECT code, name, datacplrate100, datacplrate4
                    FROM (
                    ".$arrMatkulGetData."
                    ) main
                    GROUP BY code
                ";
            }
        }
        $getDataTemp = DB::select(DB::raw($arrMatkulGetData));
        sort($getDataTemp);

        $stateCode = null;
        $getData['keys'] = [];
        foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
            if ($valueGetDataTemp->name != $stateCode) {
                if ($stateCode != null) {
                    array_push($getData['keys'], $stateCode);
                    $getData[$stateCode]['datacplrate100'] = $getData[$stateCode]['datacplrate100']/$getData[$stateCode]['count'];
                    $getData[$stateCode]['datacplrate4'] = $getData[$stateCode]['datacplrate4']/$getData[$stateCode]['count'];
                }

                $getData[$valueGetDataTemp->name]['datacplrate100'] = (int)$valueGetDataTemp->datacplrate100;
                $getData[$valueGetDataTemp->name]['datacplrate4'] = (float)number_format((int)$valueGetDataTemp->datacplrate100 / 100 * 4, 2);
                $getData[$valueGetDataTemp->name]['count'] = 1;

                $stateCode = $valueGetDataTemp->name;
            }else{
                $getData[$valueGetDataTemp->name]['datacplrate100'] += (int)$valueGetDataTemp->datacplrate100;
                $getData[$valueGetDataTemp->name]['datacplrate4'] += (float)number_format((int)$valueGetDataTemp->datacplrate100 / 100 * 4, 2);
                $getData[$valueGetDataTemp->name]['count'] += 1;
            }
        }

        
        $dataSeries100 = [0];
        $dataSeries4 = [0];
        $dataCategories = [''];
        $dataSeriesCpls = [];
        $dataCategoriesCpls = [];
        foreach ($getData['keys'] as $key => $value) {
            array_push($dataSeries100, $getData[$value]['datacplrate100']);
            array_push($dataSeries4, $getData[$value]['datacplrate4']);
            array_push($dataCategories, $value);

            array_push($dataSeriesCpls, $getData[$value]['datacplrate4']);
            array_push($dataCategoriesCpls, $value);
        }
        array_push($dataSeries100, 0);
        array_push($dataSeries4, 0);
        array_push($dataCategories, '');

        return response()->json([
            "id" => 1,
            "data_categories" => $dataCategories,
            "data_series" => [
                [
                    "name" => "Rate_100",
                    "data" => $dataSeries100
                ],
                [
                    "name" => "Rate_4",
                    "data" => $dataSeries4
                ]
            ],
            'data_series_cpls' => $dataSeriesCpls,
            'data_categories_cpls' => $dataCategoriesCpls
        ]);
    }

    public function indexStudentDetailChartCplStatistic(Request $request)
    {
        $arrMatkulGetData = null;
        $arrMatkulGetDataFinal = null;
        $arrMatkulGetData .= "
            SELECT m_cpl.code as code, a_mata_kuliah.unique_code, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
            JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpl.*
                FROM a_mata_kuliah_cpl
                JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
                WHERE a_mata_kuliah.unique_code = '".$request['uniqueCode']."'
                AND a_mahasiswa_program_studies.m_mahasiswa_nim LIKE '%".str_replace(' ', '', $request->nim)."%'
            )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
            JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
            JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request['uniqueCode']."'
            AND a_mahasiswa_program_studies.m_mahasiswa_nim LIKE '%".str_replace(' ', '', $request->nim)."%'
            AND a_mata_kuliah.deleted_at IS NULL
            GROUP BY a_mata_kuliah.unique_code, m_cpl.code
        ";

        $getDataTemp = DB::select(DB::raw($arrMatkulGetData));
        sort($getDataTemp);

        $stateCode = null;
        $getData['keys'] = [];
        foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
            if ($valueGetDataTemp->code != $stateCode) {
                if ($stateCode != null) {
                    array_push($getData['keys'], $stateCode);
                    $getData[$stateCode]['datacplrate100'] = $getData[$stateCode]['datacplrate100']/$getData[$stateCode]['count'];
                    $getData[$stateCode]['datacplrate4'] = $getData[$stateCode]['datacplrate4']/$getData[$stateCode]['count'];
                }

                $getData[$valueGetDataTemp->code]['datacplrate100'] = (int)$valueGetDataTemp->datacplrate100;
                $getData[$valueGetDataTemp->code]['datacplrate4'] = (float)number_format((int)$valueGetDataTemp->datacplrate100 / 100 * 4, 2);
                $getData[$valueGetDataTemp->code]['count'] = 1;

                $stateCode = $valueGetDataTemp->code;
            }else{
                $getData[$valueGetDataTemp->code]['datacplrate100'] += (int)$valueGetDataTemp->datacplrate100;
                $getData[$valueGetDataTemp->code]['datacplrate4'] += (float)number_format((int)$valueGetDataTemp->datacplrate100 / 100 * 4, 2);
                $getData[$valueGetDataTemp->code]['count'] += 1;
            }
        }

        $dataSeries100 = [0];
        $dataSeries4 = [0];
        $dataCategories = [''];
        $dataSeriesCpls = [];
        $dataCategoriesCpls = [];
        foreach ($getData['keys'] as $key => $value) {
            array_push($dataSeries100, $getData[$value]['datacplrate100']);
            array_push($dataSeries4, $getData[$value]['datacplrate4']);
            array_push($dataCategories, $value);

            array_push($dataSeriesCpls, $getData[$value]['datacplrate4']);
            array_push($dataCategoriesCpls, $value);
        }
        array_push($dataSeries100, 0);
        array_push($dataSeries4, 0);
        array_push($dataCategories, '');

        return response()->json([
            "id" => 1,
            "data_categories" => $dataCategories,
            "data_series" => [
                [
                    "name" => "Rate_100",
                    "data" => $dataSeries100
                ],
                [
                    "name" => "Rate_4",
                    "data" => $dataSeries4
                ]
            ],
            'data_series_cpls' => $dataSeriesCpls,
            'data_categories_cpls' => $dataCategoriesCpls
        ]);
    }

    public function indexCplMarkByCwDetail(Request $request)
    {
        $getCpl = AMataKuliah::selectRaw('a_mata_kuliah_cpl.cpl_id, m_cpl.code')
                            ->join('a_mata_kuliah_cpl', 'a_mata_kuliah.id', '=' ,'a_mata_kuliah_cpl.a_mata_kuliah_id')
                            ->join('m_cpl', 'a_mata_kuliah_cpl.cpl_id', '=' ,'m_cpl.id')
                            ->where('a_mata_kuliah.unique_code', 'LIKE', '%'.$request->uniqueCode.'%')
                            ->where('a_mata_kuliah.deleted_at', null)
                            ->get();
                
        $getData = DB::select("
            SELECT m_mahasiswa.nim as m_mahasiswa_nim, a_mata_kuliah_cpl.cpl_id, m_cpl.code,
                    SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as cpls
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
            JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpl.*
                FROM a_mata_kuliah_cpl
                JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                AND a_mata_kuliah.deleted_at IS NULL
            )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
            JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
            JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
            AND a_mata_kuliah.deleted_at IS NULL
            GROUP BY m_mahasiswa.nim, a_mata_kuliah_cpl.cpl_id, m_cpl.code
            ORDER BY m_mahasiswa.nim ASC, a_mata_kuliah_cpl.cpl_id ASC, m_cpl.code ASC
        ");

        $getScore = MScore::get();

        // dd($getData);

        $arrScore = [];
        $tempScore = [];
        $paramScore = [];
        $listScore = [];
        foreach ($getScore as $keyScore => $valueScore) {
            array_push($listScore, $valueScore['code']);
            $arrScore[(string)$valueScore['code']] = [];
            $tempScore[(string)$valueScore['code']] = [];
            $paramScore[(string)$valueScore['code']] = [
                'min' => $valueScore['min_point'],
                'max' => $valueScore['max_point']
            ];
        }

        $dataCategories = [];
        $dataSeries = [];
        foreach ($getCpl as $keyCpl => $valueCpl) {
            array_push($dataCategories, $valueCpl->code);
            // dump($valueCpl);

            foreach ($getData as $keyData => $valueData) {
                if ($valueData->cpl_id == $valueCpl->cpl_id) {
                // $myscore = (int)$valueData->score/(int)$valueData->cplweight*100;
                // dump($valueData->score . '   ' . $valueData->cplweight . '  <> ' . $valueCpl->code);
                $myscore = $valueData->cpls;
                    foreach ($listScore as $keyListScore => $valueListScore) {

                        if ((float)$paramScore[$valueListScore]['min'] <= $myscore && (float)$paramScore[$valueListScore]['max'] >= (float)$myscore) {
                            // array_push($tempScore[$valueListScore], 'true');
                            // dd($tempScore[$valueListScore]);
                            array_push($tempScore[$valueListScore], $myscore);
                            // dd($tempScore[$valueListScore]);

                        }
                        // dump((float)$paramScore[$valueListScore]['min'] <= (float)$myscore && (float)$paramScore[$valueListScore]['max'] >= (float)$myscore);
                    }
                }
            }
            foreach ($getScore as $keyScore => $valueScore) {
                array_push($arrScore[(string)$valueScore['code']], count($tempScore[(string)$valueScore['code']]));
                // array_push($dataSeries, [
                //     'name' => $valueScore['code'],
                //     'data' => $arrScore[(string)$valueScore['code']]
                // ]);
            }
            // dd($tempScore);
            foreach ($getScore as $keyScore => $valueScore) {
                $tempScore[(string)$valueScore['code']] = [];
            }
            // $tempScore = [];
        }
        // dd($arrScore);

        foreach ($getScore as $keyScoreLast => $valueScoreLast) {
        // $arrScore[$valueScoreLast['code']] = count($tempScore[$valueScoreLast['code']]);
            array_push($dataSeries, [
                'name' => $valueScoreLast['code'],
                'data' => $arrScore[(string)$valueScoreLast['code']]
            ]);
        }

        return response()->json([
            'data_series' => $dataSeries,
            'data_categories' => $dataCategories
        ]);
    }

    public function indexCpmkMarkByCwDetail(Request $request)
    {
        $getCpmk = AMataKuliah::selectRaw('a_mata_kuliah_cpmk.cpmk_id')
                            ->join('a_mata_kuliah_cpmk', 'a_mata_kuliah.id', '=' ,'a_mata_kuliah_cpmk.a_mata_kuliah_id')
                            ->where('a_mata_kuliah.unique_code', 'LIKE', '%'.$request->uniqueCode.'%')
                            ->where('a_mata_kuliah.deleted_at', null)
                            ->get();

        $getData = DB::select("
            SELECT m_mahasiswa.nim as m_mahasiswa_nim, a_mata_kuliah_cpmk.cpmk_id,
                    SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpmk.weight)) * 100 / COUNT(a_cw_question_cpmk.a_mata_kuliah_cpmk_id) as cpmks
            FROM a_mata_kuliah
            JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
            JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
            JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
            JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
            JOIN a_cw_question_cpmk ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpmk.a_cw_question_id
            LEFT JOIN (
                SELECT a_mata_kuliah_cpmk.*
                FROM a_mata_kuliah_cpmk
                JOIN a_mata_kuliah ON a_mata_kuliah_cpmk.a_mata_kuliah_id = a_mata_kuliah.id
                WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
                AND a_mata_kuliah.deleted_at IS NULL
            )a_mata_kuliah_cpmk ON a_cw_question_cpmk.a_mata_kuliah_cpmk_id = a_mata_kuliah_cpmk.id
            JOIN m_cpmk ON a_mata_kuliah_cpmk.cpmk_id = m_cpmk.id
            JOIN a_course_work_questions ON a_cw_question_cpmk.a_cw_question_id = a_course_work_questions.id
            JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
            JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
            WHERE a_mata_kuliah.unique_code = '".$request->uniqueCode."'
            AND a_mata_kuliah.deleted_at IS NULL
            GROUP BY m_mahasiswa.nim, a_mata_kuliah_cpmk.cpmk_id
            ORDER BY m_mahasiswa.nim ASC, a_mata_kuliah_cpmk.cpmk_id ASC
        ");

        $getScore = MScore::get();

        $arrScore = [];
        $tempScore = [];
        $paramScore = [];
        $listScore = [];
        foreach ($getScore as $keyScore => $valueScore) {
            array_push($listScore, $valueScore['code']);
            $arrScore[(string)$valueScore['code']] = [];
            $tempScore[(string)$valueScore['code']] = [];
            $paramScore[(string)$valueScore['code']] = [
                'min' => $valueScore['min_point'],
                'max' => $valueScore['max_point']
            ];
        }

        $dataCategories = [];
        $dataSeries = [];
        foreach ($getCpmk as $keyCpmk => $valueCpmk) {
            array_push($dataCategories, 'CPMK'.(int)$valueCpmk['cpmk_id'] - (int)$getCpmk[0]['cpmk_id'] + 1);

            foreach ($getData as $keyData => $valueData) {
                if ($valueData->cpmk_id == $valueCpmk->cpmk_id) {
                    $myscore = $valueData->cpmks;
                    foreach ($listScore as $keyListScore => $valueListScore) {
    
                        if ((float)$paramScore[$valueListScore]['min'] <= $myscore && (float)$paramScore[$valueListScore]['max'] >= (float)$myscore) {
                            // array_push($tempScore[$valueListScore], 'true');
                            // dd($tempScore[$valueListScore]);
                            array_push($tempScore[$valueListScore], $myscore);
                            // dd($tempScore[$valueListScore]);
    
                        }
                        // dump((float)$paramScore[$valueListScore]['min'] <= (float)$myscore && (float)$paramScore[$valueListScore]['max'] >= (float)$myscore);
                    }
                }
            }
            foreach ($getScore as $keyScore => $valueScore) {
                array_push($arrScore[(string)$valueScore['code']], count($tempScore[(string)$valueScore['code']]));
                // array_push($dataSeries, [
                //     'name' => $valueScore['code'],
                //     'data' => $arrScore[(string)$valueScore['code']]
                // ]);
            }
            // dd($tempScore);
            foreach ($getScore as $keyScore => $valueScore) {
                $tempScore[(string)$valueScore['code']] = [];
            }
            // $tempScore = [];
        }
        // dd($arrScore);
        
        foreach ($getScore as $keyScoreLast => $valueScoreLast) {
            // $arrScore[$valueScoreLast['code']] = count($tempScore[$valueScoreLast['code']]);
            array_push($dataSeries, [
                'name' => $valueScoreLast['code'],
                'data' => $arrScore[(string)$valueScoreLast['code']]
            ]);
        }

        return response()->json([
            'data_series' => $dataSeries,
            'data_categories' => $dataCategories
        ]);

        return response()->json([
            'data_series' => [
                        [
                            'name' => 'A',
                            'data' => [2, 0, 1, 0, 0, 0]
                        ], [
                            'name' => 'B',
                            'data' => [3, 6, 4, 5, 7, 0]
                        ], [
                            'name' => 'B +',
                            'data' => [2, 2, 2, 6, 4, 3]
                        ], [
                            'name' => 'C',
                            'data' => [5, 2, 4, 1, 0, 5]
                        ], [
                            'name' => 'C +',
                            'data' => [0, 2, 1, 5, 3, 6]
                        ], [
                            'name' => 'D',
                            'data' => [1, 0, 2, 1, 3, 2]
                        ], [
                            'name' => 'E',
                            'data' => [0, 1, 3, 2, 0, 3]
                        ]
                    ],
            'data_categories' => ['CPMK2', 'CPMK21', 'CPMK25', 'CPMK4', 'CPMK6', 'CPMK7']
        ]);
    }

    public function indexListingQuestion(Request $request)
    {
        $getEvaluation = AMataKuliahEvaluation::selectRaw('a_mata_kuliah_evaluations.id, a_mata_kuliah_evaluations.question, a_mata_kuliah_evaluations.answer')
                                            ->join('a_mata_kuliah', 'a_mata_kuliah_evaluations.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                            ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                            ->where('a_mata_kuliah.deleted_at', null)
                                            ->orderBy('id', 'ASC')
                                            ->get();

        return response()->json($getEvaluation);
    }

    public function submitEvaluation(Request $request)
    {
        // dd($request->data);
        foreach ($request->data as $keyData => $valueData) {
            AMataKuliahEvaluation::where('id', $valueData['id'])
                                ->update([
                                    'answer' => $valueData['answer']
                                ]);
        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil update jawaban'
        ]);
    }

    public function indexListingStandingStudent(Request $request)
    {
        if ($request->uniqueCode) {  // ASSESSMENT
            $getUniqueCode = AUserProgramStudy::selectRaw('a_mata_kuliah.unique_code')
                                        ->join('a_mata_kuliah', 'a_user_program_studies.program_study_id', '=', 'a_mata_kuliah.master_id')
                                        ->where('a_user_program_studies.user_id', auth()->user()->id)
                                        ->where('a_mata_kuliah.unique_code', $request->uniqueCode)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->get();
        
            $arrMatkulGetData = null;
            $arrMatkulGetDataFinal = null;
            foreach ($getUniqueCode as $keyUniqueCode => $valueUniqueCode) {
                $arrMatkulGetData .= "
                    SELECT m_mahasiswa.name, m_mahasiswa.nim, m_cpl.code as code, a_mata_kuliah.unique_code, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
                    FROM a_mata_kuliah
                    JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                    JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
                    JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
                    JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
                    JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
                    LEFT JOIN (
                        SELECT a_mata_kuliah_cpl.*
                        FROM a_mata_kuliah_cpl
                        JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                        WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                        AND a_mata_kuliah.deleted_at IS NULL
                    )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
                    JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
                    JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
                    JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
                    JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
                    WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                    AND a_mata_kuliah.deleted_at IS NULL
                    GROUP BY a_mata_kuliah.unique_code, m_cpl.code, m_mahasiswa.name, m_mahasiswa.nim
                ";

                if ($keyUniqueCode < count($getUniqueCode) - 1) {
                    $arrMatkulGetData .= " UNION ";
                }else{
                    $arrMatkulGetDataFinal = "
                        SELECT code, datacplrate100, datacplrate4
                        FROM (
                            ".$arrMatkulGetData."
                        ) main
                        GROUP BY code
                    ";
                }
            }
            $getDataTemp = DB::select(DB::raw($arrMatkulGetDataFinal));
            sort($getDataTemp);

            $stateCode = null;
            $getTop3['keys'] = [];
            foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
                if (explode('(', $valueGetDataTemp->name)[0] != $stateCode) {
                    if ($stateCode != null) {
                        array_push($getTop3['keys'], $stateCode);
                        $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];
                    }

                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] = (float)$valueGetDataTemp->datacplrate100;
                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] = 1;

                    $stateCode = explode('(', $valueGetDataTemp->name)[0];
                }else{
                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] += (float)$valueGetDataTemp->datacplrate100;
                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                    $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] += 1;
                }
            }

            // array_push($getTop3['keys'], $stateCode);
            $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];

            $studentTop3 = [];
            $studentTop3Count = 0;
            rsort($getTop3);
            foreach (array_slice($getTop3, 1, 3) as $keyTop3 => $valueTop3) {
                $studentTop3Count += 1;
                array_push($studentTop3, [
                    'id' => $studentTop3Count,
                    'nim' => $valueTop3['nim'],
                    'name' => $valueTop3['name'],
                    'nilai' => (float)$valueTop3['datacplrate100'],
                ]);
            }

            $studentBottom3 = [];
            $studentBottom3Count = 0;
            sort($getTop3);
            foreach (array_slice($getTop3, 0, 3) as $keyBottom3 => $valueBottom3) {
                $studentBottom3Count += 1;
                array_push($studentBottom3, [
                    'nilai' => (float)$valueBottom3['datacplrate100'],
                    'id' => $studentBottom3Count,
                    'nim' => $valueBottom3['nim'],
                    'name' => $valueBottom3['name'],
                ]);
            }
            rsort($studentBottom3);

            $studentMiddle3 = [];
            $studentMiddle3Count = 0;
            rsort($getTop3);
            foreach (array_slice($getTop3, count($getTop3) / 2 , 3) as $keyMiddle3 => $valueMiddle3) {
                $studentMiddle3Count += 1;
                if ($studentMiddle3Count <= 3) {
                    array_push($studentMiddle3, [
                        'nilai' => (float)$valueMiddle3['datacplrate100'],
                        'id' => $studentMiddle3Count,
                        'nim' => $valueMiddle3['nim'],
                        'name' => $valueMiddle3['name'],
                    ]);
                }
            }
        
            $datas = [
                [
                    'id' => 1,
                    'title' => "Student Top", 
                    'data' => $studentTop3
                ],
                [
                    'id' => 2,
                    'title' => "Student Middle",
                    'data' =>  $studentMiddle3
                ],
                [
                    'id' => 3,
                    'title' => "Student Bottom",
                    'data' => $studentBottom3
                ]
            ];
    
            return response()->json($datas);
        }else{  // HOME

            $getTop3 = null;
            $getMiddle3 = null;

            if ($request->tahun) {
                $getUniqueCode = AUserProgramStudy::selectRaw('a_mata_kuliah.unique_code')
                                ->join('a_mata_kuliah', 'a_user_program_studies.program_study_id', '=', 'a_mata_kuliah.master_id')
                                ->where('a_user_program_studies.user_id', auth()->user()->id)
                                ->where('a_mata_kuliah.year', 'LIKE', '%'.$request->tahun.'%')
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->get();

                $arrMatkulGetData = null;
                $arrMatkulGetDataFinal = null;
                foreach ($getUniqueCode as $keyUniqueCode => $valueUniqueCode) {
                    $arrMatkulGetData .= "
                        SELECT m_mahasiswa.name, m_mahasiswa.nim, m_cpl.code as code, a_mata_kuliah.unique_code, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
                        FROM a_mata_kuliah
                        JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                        JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
                        JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
                        JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
                        JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
                        LEFT JOIN (
                            SELECT a_mata_kuliah_cpl.*
                            FROM a_mata_kuliah_cpl
                            JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                            WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                        )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
                        JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
                        JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
                        JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
                        JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
                        WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                        AND a_mata_kuliah.deleted_at IS NULL
                        GROUP BY a_mata_kuliah.unique_code, m_cpl.code, m_mahasiswa.name, m_mahasiswa.nim
                    ";

                    if ($keyUniqueCode < count($getUniqueCode) - 1) {
                        $arrMatkulGetData .= " UNION ";
                    }else{
                        $arrMatkulGetDataFinal = "
                            SELECT code, datacplrate100, datacplrate4
                            FROM (
                                ".$arrMatkulGetData."
                            ) main
                            GROUP BY code
                        ";
                    }
                }
                $getDataTemp = DB::select(DB::raw($arrMatkulGetData));
                sort($getDataTemp);

                $stateCode = null;
                $getTop3['keys'] = [];
                foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
                    if (explode('(', $valueGetDataTemp->name)[0] != $stateCode) {
                        if ($stateCode != null) {
                            array_push($getTop3['keys'], $stateCode);
                            $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];
                        }

                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] = (float)$valueGetDataTemp->datacplrate100;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] = 1;

                        $stateCode = explode('(', $valueGetDataTemp->name)[0];
                    }else{
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] += (float)$valueGetDataTemp->datacplrate100;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] += 1;
                    }
                }

                $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];

                $studentTop3 = [];
                $studentTop3Count = 0;
                rsort($getTop3);
                foreach (array_slice($getTop3, 1, 3) as $keyTop3 => $valueTop3) {
                    $studentTop3Count += 1;
                    array_push($studentTop3, [
                        'id' => $studentTop3Count,
                        'nim' => $valueTop3['nim'],
                        'name' => $valueTop3['name'],
                        'nilai' => (float)$valueTop3['datacplrate100'],
                    ]);
                }

                $studentBottom3 = [];
                $studentBottom3Count = 0;
                sort($getTop3);
                foreach (array_slice($getTop3, 0, 3) as $keyBottom3 => $valueBottom3) {
                    $studentBottom3Count += 1;
                    array_push($studentBottom3, [
                        'nilai' => (int)$valueBottom3['datacplrate100'],
                        'id' => $studentBottom3Count,
                        'nim' => $valueBottom3['nim'],
                        'name' => $valueBottom3['name'],
                    ]);
                }
                rsort($studentBottom3);

                $studentMiddle3 = [];
                $studentMiddle3Count = 0;
                rsort($getTop3);
                foreach (array_slice($getTop3, count($getTop3) / 2 , 3) as $keyMiddle3 => $valueMiddle3) {
                    $studentMiddle3Count += 1;
                    if ($studentMiddle3Count <= 3) {
                        array_push($studentMiddle3, [
                            'nilai' => (int)$valueMiddle3['datacplrate100'],
                            'id' => $studentMiddle3Count,
                            'nim' => $valueMiddle3['nim'],
                            'name' => $valueMiddle3['name'],
                        ]);
                    }
                }

                $datas = [
                    [
                    'id' => 1,
                    'title' => "Student Top", 
                    'data' => $studentTop3
                    ],
                    [
                    'id' => 2,
                    'title' => "Student Middle",
                    'data' =>  $studentMiddle3
                    ],
                    [
                    'id' => 3,
                    'title' => "Student Bottom",
                    'data' => $studentBottom3
                    ]
                ];

                return response()->json($datas);
                
            }else if ($request->semester) {
                $getUniqueCode = AUserProgramStudy::selectRaw('a_mata_kuliah.unique_code')
                                ->join('a_mata_kuliah', 'a_user_program_studies.program_study_id', '=', 'a_mata_kuliah.master_id')
                                ->where('a_user_program_studies.user_id', auth()->user()->id)
                                ->whereIn('a_mata_kuliah.semester', ((strtolower($request->semester) == 'ganjil')? [1,3,5,7,9,11] : [2,4,6,8,10]))
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->get();

                $arrMatkulGetData = null;
                $arrMatkulGetDataFinal = null;
                foreach ($getUniqueCode as $keyUniqueCode => $valueUniqueCode) {
                    $arrMatkulGetData .= "
                        SELECT m_mahasiswa.name, m_mahasiswa.nim, m_cpl.code as code, a_mata_kuliah.unique_code, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
                        FROM a_mata_kuliah
                        JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                        JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
                        JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
                        JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
                        JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
                        LEFT JOIN (
                            SELECT a_mata_kuliah_cpl.*
                            FROM a_mata_kuliah_cpl
                            JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                            WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                        )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
                        JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
                        JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
                        JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
                        JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
                        WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                        AND a_mata_kuliah.deleted_at IS NULL
                        GROUP BY a_mata_kuliah.unique_code, m_cpl.code, m_mahasiswa.name, m_mahasiswa.nim
                    ";

                    if ($keyUniqueCode < count($getUniqueCode) - 1) {
                        $arrMatkulGetData .= " UNION ";
                    }else{
                        $arrMatkulGetDataFinal = "
                            SELECT code, datacplrate100, datacplrate4
                            FROM (
                                ".$arrMatkulGetData."
                            ) main
                            GROUP BY code
                        ";
                    }
                }
                $getDataTemp = DB::select(DB::raw($arrMatkulGetData));
                sort($getDataTemp);

                $stateCode = null;
                $getTop3['keys'] = [];
                foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
                    if (explode('(', $valueGetDataTemp->name)[0] != $stateCode) {
                        if ($stateCode != null) {
                            array_push($getTop3['keys'], $stateCode);
                            $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];
                        }

                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] = (int)$valueGetDataTemp->datacplrate100;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] = 1;

                        $stateCode = explode('(', $valueGetDataTemp->name)[0];
                    }else{
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] += (int)$valueGetDataTemp->datacplrate100;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] += 1;
                    }
                }

                $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];

                $studentTop3 = [];
                $studentTop3Count = 0;
                rsort($getTop3);
                foreach (array_slice($getTop3, 1, 3) as $keyTop3 => $valueTop3) {
                    $studentTop3Count += 1;
                    array_push($studentTop3, [
                        'id' => $studentTop3Count,
                        'nim' => $valueTop3['nim'],
                        'name' => $valueTop3['name'],
                        'nilai' => (int)$valueTop3['datacplrate100'],
                    ]);
                }

                $studentBottom3 = [];
                $studentBottom3Count = 0;
                sort($getTop3);
                foreach (array_slice($getTop3, 0, 3) as $keyBottom3 => $valueBottom3) {
                    $studentBottom3Count += 1;
                    array_push($studentBottom3, [
                        'nilai' => (int)$valueBottom3['datacplrate100'],
                        'id' => $studentBottom3Count,
                        'nim' => $valueBottom3['nim'],
                        'name' => $valueBottom3['name'],
                    ]);
                }
                rsort($studentBottom3);

                $studentMiddle3 = [];
                $studentMiddle3Count = 0;
                rsort($getTop3);
                foreach (array_slice($getTop3, count($getTop3) / 2 , 3) as $keyMiddle3 => $valueMiddle3) {
                    $studentMiddle3Count += 1;
                    if ($studentMiddle3Count <= 3) {
                        array_push($studentMiddle3, [
                            'nilai' => (int)$valueMiddle3['datacplrate100'],
                            'id' => $studentMiddle3Count,
                            'nim' => $valueMiddle3['nim'],
                            'name' => $valueMiddle3['name'],
                        ]);
                    }
                }

                $datas = [
                    [
                    'id' => 1,
                    'title' => "Student Top", 
                    'data' => $studentTop3
                    ],
                    [
                    'id' => 2,
                    'title' => "Student Middle",
                    'data' =>  $studentMiddle3
                    ],
                    [
                    'id' => 3,
                    'title' => "Student Bottom",
                    'data' => $studentBottom3
                    ]
                ];

                return response()->json($datas);
            
            }else{
                $getUniqueCode = AUserProgramStudy::selectRaw('a_mata_kuliah.unique_code')
                                                ->join('a_mata_kuliah', 'a_user_program_studies.program_study_id', '=', 'a_mata_kuliah.master_id')
                                                ->where('a_user_program_studies.user_id', auth()->user()->id)
                                                ->where('a_mata_kuliah.deleted_at', null)
                                                ->get();

                $arrMatkulGetData = null;
                $arrMatkulGetDataFinal = null;
                foreach ($getUniqueCode as $keyUniqueCode => $valueUniqueCode) {
                    $arrMatkulGetData .= "
                        SELECT m_mahasiswa.name, m_mahasiswa.nim, m_cpl.code as code, a_mata_kuliah.unique_code, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
                        FROM a_mata_kuliah
                        JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
                        JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
                        JOIN m_mahasiswa ON a_mahasiswa_program_studies.m_mahasiswa_nim = m_mahasiswa.nim
                        JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
                        JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
                        LEFT JOIN (
                            SELECT a_mata_kuliah_cpl.*
                            FROM a_mata_kuliah_cpl
                            JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
                            WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                        )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
                        JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
                        JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
                        JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
                        JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
                        WHERE a_mata_kuliah.unique_code = '".$valueUniqueCode->unique_code."'
                        AND a_mata_kuliah.deleted_at IS NULL
                        GROUP BY a_mata_kuliah.unique_code, m_cpl.code, m_mahasiswa.name, m_mahasiswa.nim
                    ";

                    if ($keyUniqueCode < count($getUniqueCode) - 1) {
                        $arrMatkulGetData .= " UNION ";
                    }else{
                        $arrMatkulGetDataFinal = "
                            SELECT code, datacplrate100, datacplrate4
                            FROM (
                                ".$arrMatkulGetData."
                            ) main
                            GROUP BY code
                        ";
                    }
                }
                $getDataTemp = DB::select(DB::raw($arrMatkulGetData));
                sort($getDataTemp);

                $stateCode = null;
                $getTop3['keys'] = [];
                foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
                    if (explode('(', $valueGetDataTemp->name)[0] != $stateCode) {
                        if ($stateCode != null) {
                            array_push($getTop3['keys'], $stateCode);
                            $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];
                        }

                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] = (int)$valueGetDataTemp->datacplrate100;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] = 1;

                        $stateCode = explode('(', $valueGetDataTemp->name)[0];
                    }else{
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['datacplrate100'] += (int)$valueGetDataTemp->datacplrate100;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['name'] = explode('(', $valueGetDataTemp->name)[0];
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['nim'] = $valueGetDataTemp->nim;
                        $getTop3[explode('(', $valueGetDataTemp->name)[0]]['count'] += 1;
                    }
                }

                $getTop3[$stateCode]['datacplrate100'] = $getTop3[$stateCode]['datacplrate100']/$getTop3[$stateCode]['count'];
        
                $studentTop3 = [];
                $studentTop3Count = 0;
                rsort($getTop3);
                foreach (array_slice($getTop3, 1, 3) as $keyTop3 => $valueTop3) {
                    $studentTop3Count += 1;
                    array_push($studentTop3, [
                        'id' => $studentTop3Count,
                        'nim' => $valueTop3['nim'],
                        'name' => $valueTop3['name'],
                        'nilai' => (int)$valueTop3['datacplrate100'],
                    ]);
                }

                $studentBottom3 = [];
                $studentBottom3Count = 0;
                sort($getTop3);
                foreach (array_slice($getTop3, 0, 3) as $keyBottom3 => $valueBottom3) {
                    $studentBottom3Count += 1;
                    array_push($studentBottom3, [
                        'nilai' => (int)$valueBottom3['datacplrate100'],
                        'id' => $studentBottom3Count,
                        'nim' => $valueBottom3['nim'],
                        'name' => $valueBottom3['name'],
                    ]);
                }
                rsort($studentBottom3);
        
                $studentMiddle3 = [];
                $studentMiddle3Count = 0;
                rsort($getTop3);
                foreach (array_slice($getTop3, count($getTop3) / 2 , 3) as $keyMiddle3 => $valueMiddle3) {
                    $studentMiddle3Count += 1;
                    if ($studentMiddle3Count <= 3) {
                        array_push($studentMiddle3, [
                            'nilai' => (int)$valueMiddle3['datacplrate100'],
                            'id' => $studentMiddle3Count,
                            'nim' => $valueMiddle3['nim'],
                            'name' => $valueMiddle3['name'],
                        ]);
                    }
                }
            
                $datas = [
                    [
                        'id' => 1,
                        'title' => "Student Top", 
                        'data' => $studentTop3
                    ],
                    [
                        'id' => 2,
                        'title' => "Student Middle",
                        'data' =>  $studentMiddle3
                    ],
                    [
                        'id' => 3,
                        'title' => "Student Bottom",
                        'data' => $studentBottom3
                    ]
                ];
        
                return response()->json($datas);

            }
        }
    }

    public function indexListingDataAngkatanMahasiswa(Request $request)
    {
        $startYear = Carbon::now()->subYears(7)->format('y');
        $endYear = Carbon::now()->format('y');
        $datas = [];
        $count = 0;
        for ($i=$endYear; $i >= $startYear; $i--) { 
            $count += 1;
            array_push($datas, [
                'id_generation' => $count,
                'year_generation' => '20'.$i
            ]);
        }
        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan Data',
            'data' => $datas
        ]);
    }

    public function cplByAngkatanMahasiswa(Request $request)
    {
        $arrMatkulGetData = "
            SELECT 
                code, AVG(scale100) as scale100, AVG(scale4) as scale4
            FROM (   
                SELECT 
                    idcpl as id, code, courseworkcpl, questioncpl, AVG(float4(weightmhs) / float4(weightcpl) * 100) as scale100,
                    AVG(float4(weightmhs) / float4(weightcpl) * 4) as scale4
                FROM (   
                    SELECT amk.id as idcpl, mc.code, mcwcpl.name as courseworkcpl, mqcpl.name as questioncpl, acqcpl.weight as weightcpl
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    JOIN m_cpl mc ON amkcpl.cpl_id = mc.id
                    JOIN a_cw_question_cpl acqcpl ON amkcpl.id = acqcpl.a_mata_kuliah_cpl_id
                    JOIN a_course_work_questions acwqcpl ON acqcpl.a_cw_question_id = acwqcpl.id
                    JOIN m_course_works mcwcpl ON acwqcpl.course_work_id = mcwcpl.id
                    JOIN m_questions mqcpl ON acwqcpl.question_id = mqcpl.id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    GROUP BY mcwcpl.id, mqcpl.id, amk.id, acqcpl.weight, mc.code
                    ORDER BY amk.id, mcwcpl.id, mqcpl.id
                ) main
                JOIN (
                    SELECT amk.id as idmhs, mcw.name as courseworkmhs, mq.name as questionmhs, acqmhs.weight as weightmhs
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_mahasiswa amkmhs ON amk.id = amkmhs.a_mata_kuliah_id
                    JOIN a_mahasiswa_program_studies amps ON amkmhs.a_mahasiswa_program_study_id = amps.id
                    JOIN m_mahasiswa mm ON amps.m_mahasiswa_nim = mm.nim
                    JOIN a_cw_question_mhs acqmhs ON amkmhs.id = acqmhs.a_mata_kuliah_mahasiswa_id
                    JOIN a_course_work_questions acwq ON acqmhs.a_cw_question_id = acwq.id
                    JOIN m_course_works mcw ON acwq.course_work_id = mcw.id
                    JOIN m_questions mq ON acwq.question_id = mq.id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    AND mm.year_of_entry LIKE '%".$request->tahun."%'
                    GROUP BY mcw.id, mq.id, amk.id, acqmhs.weight
                    ORDER BY amk.id, mcw.id, mq.id
                ) secondary ON main.idcpl = secondary.idmhs AND main.courseworkcpl = secondary.courseworkmhs AND main.questioncpl = secondary.questionmhs
                GROUP BY idcpl, courseworkcpl, questioncpl, code
            ) main2
            GROUP BY code
            ORDER BY code ASC
        ";
        $getDataTemp = DB::select(DB::raw($arrMatkulGetData));

        $arrMatkulGetDataCompetencies = "
            SELECT 
                competenciesname, AVG(scale100) as scale100, AVG(scale4) as scale4
            FROM (   
                SELECT 
                    idcpl as id, code, competenciesname, courseworkcpl, questioncpl, AVG(float4(weightmhs) / float4(weightcpl) * 100) scale100, AVG(float4(weightmhs) / float4(weightcpl) * 4) scale4
                FROM (   
                    SELECT amk.id as idcpl, mc.code, m_competencies.name as competenciesname, mcwcpl.name as courseworkcpl, mqcpl.name as questioncpl, acqcpl.weight as weightcpl
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    JOIN m_cpl mc ON amkcpl.cpl_id = mc.id
                    JOIN a_cpl_competencies acc ON amkcpl.id = acc.a_mata_kuliah_cpl_id
                    JOIN a_mata_kuliah_competencies amkc ON acc.a_mata_kuliah_competencies_id = amkc.id
                    JOIN m_competencies ON amkc.competencies_id = m_competencies.id
                    JOIN a_cw_question_cpl acqcpl ON amkcpl.id = acqcpl.a_mata_kuliah_cpl_id
                    JOIN a_course_work_questions acwqcpl ON acqcpl.a_cw_question_id = acwqcpl.id
                    JOIN m_course_works mcwcpl ON acwqcpl.course_work_id = mcwcpl.id
                    JOIN m_questions mqcpl ON acwqcpl.question_id = mqcpl.id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    GROUP BY mcwcpl.id, mqcpl.id, amk.id, acqcpl.weight, mc.code, m_competencies.name
                    ORDER BY amk.id, mcwcpl.id, mqcpl.id
                ) main
                JOIN (
                    SELECT amk.id as idmhs, mcw.name as courseworkmhs, mq.name as questionmhs, acqmhs.weight as weightmhs
                    FROM a_mata_kuliah amk
                    JOIN a_user_program_studies aups ON amk.master_id = aups.program_study_id
                    JOIN a_mata_kuliah_mahasiswa amkmhs ON amk.id = amkmhs.a_mata_kuliah_id
                    JOIN a_mahasiswa_program_studies amps ON amkmhs.a_mahasiswa_program_study_id = amps.id
                    JOIN m_mahasiswa mm ON amps.m_mahasiswa_nim = mm.nim
                    JOIN a_cw_question_mhs acqmhs ON amkmhs.id = acqmhs.a_mata_kuliah_mahasiswa_id
                    JOIN a_course_work_questions acwq ON acqmhs.a_cw_question_id = acwq.id
                    JOIN m_course_works mcw ON acwq.course_work_id = mcw.id
                    JOIN m_questions mq ON acwq.question_id = mq.id
                    JOIN a_mata_kuliah_cpl amkcpl ON amk.id = amkcpl.a_mata_kuliah_id
                    WHERE amk.deleted_at IS NULL
                    AND aups.user_id = ".auth()->user()->id."
                    AND mm.year_of_entry LIKE '%".$request->tahun."%'
                    GROUP BY mcw.id, mq.id, amk.id, acqmhs.weight
                    ORDER BY amk.id, mcw.id, mq.id
                ) secondary ON main.idcpl = secondary.idmhs AND main.courseworkcpl = secondary.courseworkmhs AND main.questioncpl = secondary.questionmhs
                GROUP BY idcpl, courseworkcpl, questioncpl, code, competenciesname
            ) main2
            GROUP BY competenciesname
            ORDER BY competenciesname ASC
        ";
        $getDataTempCompetencies = DB::select(DB::raw($arrMatkulGetDataCompetencies));

        $arrRate100 = [0];
        $arrRate4 = [0];
        $arrRate4SpiderChart = [];
        $arrCategoriesSpider = [];
        $arrCategories = [''];

        $arrRate100Competencies = [0];
        $arrRate4Competencies = [0];
        $arrRate4SpiderChartCompetencies = [];
        $arrCategoriesCompetenciesSpider = [];
        $arrCategoriesCompetencies = [''];

        foreach ($getDataTemp as $keyMatkulCpl => $valueMatkulCpl) {
            array_push($arrRate100, (float)number_format($valueMatkulCpl->scale100, 2));
            array_push($arrRate4, (float)number_format($valueMatkulCpl->scale4, 2));
            array_push($arrRate4SpiderChart, (float)number_format($valueMatkulCpl->scale4, 2));
            array_push($arrCategories, $valueMatkulCpl->code);
            array_push($arrCategoriesSpider, $valueMatkulCpl->code);
        }

        foreach ($getDataTempCompetencies as $keyMatkulCompetencies => $valueMatkulCompetencies) {
            array_push($arrRate100Competencies, (float)number_format($valueMatkulCompetencies->scale100, 2));
            array_push($arrRate4Competencies, (float)number_format($valueMatkulCompetencies->scale4, 2));
            array_push($arrRate4SpiderChartCompetencies, (float)number_format($valueMatkulCompetencies->scale4, 2));
            array_push($arrCategoriesCompetencies, $valueMatkulCompetencies->competenciesname);
            array_push($arrCategoriesCompetenciesSpider, $valueMatkulCompetencies->competenciesname);
        }

        array_push($arrRate100, 0);
        array_push($arrRate4, 0);
        array_push($arrCategories, '');

        array_push($arrRate100Competencies, 0);
        array_push($arrRate4Competencies, 0);
        array_push($arrCategoriesCompetencies, '');

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan Data',
            'data' => [
                [
                    'id' => 1,
                    'name' => 'cpl',
                    'data_categories' => $arrCategories,
                    'data_series' => [
                        [
                            'name' => "Rate_100",
                            'data' => $arrRate100
                        ],
                        [
                            'name' => "Rate_4",
                            'data' => $arrRate4
                        ]
                    ]
                ],
                [
                    'id' => 2,
                    'name' => 'cpl_spider',
                    'data_categories' => $arrCategoriesSpider,
                    'data_series' => [
                        [
                            'name' => "Rate_4_Spider_Chart",
                            'data' => $arrRate4SpiderChart
                        ]
                    ]
                ],
                [
                    'id' => 3,
                    'name' => 'competencies',
                    'data_categories' => $arrCategoriesCompetencies,
                    'data_series' => [
                        [
                            'name' => "Rate_100",
                            'data' => $arrRate100Competencies
                        ],
                        [
                            'name' => "Rate_4",
                            'data' => $arrRate4Competencies
                        ],
                        [
                            'name' => "Rate_4_Spider_Chart",
                            'data' => $arrRate4SpiderChartCompetencies
                        ]
                    ]
                ],
                [
                    'id' => 4,
                    'name' => 'competencies_spider',
                    'data_categories' => $arrCategoriesCompetenciesSpider,
                    'data_series' => [
                        [
                            'name' => "Rate_4_Spider_Chart",
                            'data' => $arrRate4SpiderChartCompetencies
                        ]
                    ]
                ],
            ]
        ]);
    }

    public function deleteAssessment(Request $request)
    {
        $delete = AMataKuliah::where('unique_code', $request->uniqueCode)
                    ->update([
                        'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                    ]);

        if ($delete) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil menghapus data Assessment'
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Gagal menghapus data Assessment'
            ]);
        }
    }

    public function standartDeviation($arr)
    {
        $num_of_elements = count($arr);
          
        $variance = 0.0;
        $average = 0;
          
        // calculating mean using array_sum() method
        try {
            $average = array_sum($arr)/$num_of_elements;
        } catch (\Throwable $th) {
            //throw $th;
        }
          
        foreach($arr as $i)
        {
            // sum of squares of differences between 
                        // all numbers and means.
            $variance += pow(($i - $average), 2);
        }
          
        return (float)number_format((float)sqrt($variance/(($num_of_elements == 0) ? 1 : $num_of_elements)),2);
    }
}
