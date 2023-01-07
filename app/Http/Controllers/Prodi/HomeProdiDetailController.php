<?php

namespace App\Http\Controllers\Prodi;

use Illuminate\Http\Request;
use App\Models\AMataKuliah;
use App\Models\ACplCompetency;
use App\Models\AUserProgramStudy;
use App\Models\ACwQuestionCpl;
use App\Models\ACwQuestionMhs;
use Carbon\Carbon;
use DB;

class HomeProdiDetailController extends Controller
{
    public function indexDosen(Request $request)
    {
      $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

      $getMatkul = AMataKuliah::selectRaw('a_mata_kuliah.id, m_mata_kuliah.code, m_mata_kuliah.name as matkulname')
                              ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                              ->where('a_mata_kuliah.dosen_nidn', 'LIKE', '%'.$request->nidn.'%')
                              ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                              ->where('a_mata_kuliah.deleted_at', null)
                              ->get();

      $getMatkulArray = $getMatkul->toArray();

      // dd($getMatkul);
      // dd($getMatkul);
      foreach ($getMatkul as $key => $value) {
        $sqlCompetencies = "
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
                  AND amk.id = ".$value->id."
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
                  AND amk.id = ".$value->id."
                  GROUP BY mcw.id, mq.id, amk.id, acqmhs.weight, mm.nim
                  ORDER BY amk.id, mcw.id, mq.id
                  ) secondary ON main.idcpl = secondary.idmhs AND main.courseworkcpl = secondary.courseworkmhs AND main.questioncpl = secondary.questionmhs
              GROUP BY idcpl, courseworkcpl, questioncpl, code, competenciesname
          ) main2
          GROUP BY competenciesname
          ORDER BY competenciesname ASC
        ";

        $getDataTemp = DB::select(DB::raw($sqlCompetencies));

        $getMatkulArray[$key]['dataCompetencies'] = $getDataTemp;
      }

      $arrMatkul = [];
      $dataSeries100 = [];
      $dataSeries4 = [];
      $dataCategories = [];
      $stateMatkul = null;
      $stateMatkulName = null;
      foreach ($getMatkul as $key => $value) {
        
        $sqlCpl = "
            SELECT 
                code as cplcode, AVG(scale100) as scale100, AVG(scale4) as scale4
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
                    AND amk.id = ".$value->id."
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
                    AND amk.id = ".$value->id."
                    GROUP BY mcw.id, mq.id, amk.id, acqmhs.weight, mm.nim
                    ORDER BY amk.id, mcw.id, mq.id
                ) secondary ON main.idcpl = secondary.idmhs AND main.courseworkcpl = secondary.courseworkmhs AND main.questioncpl = secondary.questionmhs
                GROUP BY idcpl, courseworkcpl, questioncpl, code
            ) main2
            GROUP BY code
            ORDER BY code ASC
        ";
        
        $cpl = DB::select(DB::raw($sqlCpl));
        
        $getMatkulArray[$key]['dataCpl'] = $cpl;
      }

      $dataSeries100 = [];
      $dataSeries4 = [];
      $dataCategories = [];
      $stateMatkul = null;
      $stateMatkulName = null;

      foreach ($getMatkulArray as $key => $value) {
        for ($i=0; $i < count($value['dataCpl']); $i++) { 
          if ($stateMatkul == null) {
            $stateMatkul = $value['code'];
            $stateMatkulName = $value['matkulname'];
            array_push($dataSeries100, (float)number_format($value['dataCpl'][$i]->scale100, 2));
            array_push($dataSeries4, (float)number_format($value['dataCpl'][$i]->scale100/ 100 * 4, 2));
            array_push($dataCategories, $value['dataCpl'][$i]->cplcode);
          }else if($stateMatkul != null && $value['code'] == $stateMatkul){
            array_push($dataSeries100, (float)number_format($value['dataCpl'][$i]->scale100, 2));
            array_push($dataSeries4, (float)number_format($value['dataCpl'][$i]->scale100/ 100 * 4, 2));
            array_push($dataCategories, $value['dataCpl'][$i]->cplcode);
          }else if ($stateMatkul != null && $value['code'] != $stateMatkul) {
            $dataCategoriesNew = $dataCategories;
            $dataSeries100New = $dataSeries100;
            $dataSeries4New = $dataSeries4;

            array_push($dataCategoriesNew, '');
            array_unshift($dataCategoriesNew, '');
            array_push($dataSeries100New, 0);
            array_unshift($dataSeries100New, 0);
            array_push($dataSeries4New, 0);
            array_unshift($dataSeries4New, 0);
            
            array_push($arrMatkul, [
              'id_value_statistic' => $stateMatkul, 
              'name' =>$stateMatkulName, 
              'detail_value_statistic' =>[
                [ 
                  'id_detail_value_statistic' => 1, 
                  'name' => "CPLs", 
                  'variabels' => $dataCategories,
                  'value_variabels' =>$dataSeries4,
                  'value_variabels_rate' =>null  
                ],
                [ 
                  'id_detail_value_statistic' => 2, 
                  'name' =>"CPL Statistic", 
                  'variabels' => $dataCategoriesNew,
                  'value_variabels' => $dataSeries100New,
                  'value_variabels_rate' => $dataSeries4New
                ]
              ] 
            ]);

            $dataSeries100 = [];
            $dataSeries4 = [];
            $dataCategories = [];

            $stateMatkul = $value['code'];
            $stateMatkulName = $value['matkulname'];
            array_push($dataSeries100, (float)number_format($value['dataCpl'][$i]->scale100, 2));
            array_push($dataSeries4, (float)number_format($value['dataCpl'][$i]->scale100/ 100 * 4, 2));
            array_push($dataCategories, $value['dataCpl'][$i]->cplcode);
          }
        }
      }

      $dataCategoriesNew = $dataCategories;
      $dataSeries100New = $dataSeries100;
      $dataSeries4New = $dataSeries4;
      
      array_push($dataCategoriesNew, '');
      array_unshift($dataCategoriesNew, '');
      array_push($dataSeries100New, 0);
      array_unshift($dataSeries100New, 0);
      array_push($dataSeries4New, 0);
      array_unshift($dataSeries4New, 0);

      array_push($arrMatkul, [
        'id_value_statistic' => $stateMatkul, 
        'name' =>$stateMatkulName, 
        'detail_value_statistic' =>[
          [ 
            'id_detail_value_statistic' =>1, 
            'name' =>"CPLs", 
            'variabels' => $dataCategories,
            'value_variabels' =>$dataSeries4,
            'value_variabels_rate' =>null  
          ],
          [ 
            'id_detail_value_statistic' =>2, 
            'name' =>"CPL Statistic", 
            'variabels' => $dataCategoriesNew,
            'value_variabels' => $dataSeries100New,
            'value_variabels_rate' => $dataSeries4New
          ]
        ] 
      ]);

      $onlyTest = [];
      $dataSeries100 = [];
      $dataSeries4 = [];
      $dataCategories = [];
      $stateMatkul = null;
      $stateMatkulName = null;
      foreach ($getMatkulArray as $key => $value) {
        $testCount = 0;
        for ($i=0; $i < count($value['dataCompetencies']); $i++) { 
          if ($stateMatkul == null) {
            $stateMatkul = $value['code'];
            $stateMatkulName = $value['matkulname'];
            array_push($dataSeries100, (float)number_format($value['dataCompetencies'][$i]->scale100, 2));
            array_push($dataSeries4, (float)number_format($value['dataCompetencies'][$i]->scale100/ 100 * 4, 2));
            array_push($dataCategories, $value['dataCompetencies'][$i]->competenciesname);
          }else if($stateMatkul != null && $value['code'] == $stateMatkul){
            array_push($dataSeries100, (float)number_format($value['dataCompetencies'][$i]->scale100, 2));
            array_push($dataSeries4, (float)number_format($value['dataCompetencies'][$i]->scale100/ 100 * 4, 2));
            array_push($dataCategories, $value['dataCompetencies'][$i]->competenciesname);
          }else if ($stateMatkul != null && $value['code'] != $stateMatkul) {
            $dataCategoriesNew = $dataCategories;
            $dataSeries100New = $dataSeries100;
            $dataSeries4New = $dataSeries4;

            array_push($dataCategoriesNew, '');
            array_unshift($dataCategoriesNew, '');
            array_push($dataSeries100New, 0);
            array_unshift($dataSeries100New, 0);
            array_push($dataSeries4New, 0);
            array_unshift($dataSeries4New, 0);

            array_push($arrMatkul[$key-1]['detail_value_statistic'], 
              [ 
                'id_detail_value_statistic' =>3, 
                'name' =>"Competencies", 
                'variabels' => $dataCategories,
                'value_variabels' =>$dataSeries4,
                'value_variabels_rate' =>null  
              ]
            );
            array_push($arrMatkul[$key-1]['detail_value_statistic'], 
              [ 
                'id_detail_value_statistic' =>4,
                'name' =>"Competencies Statistic",
                'variabels' => $dataCategoriesNew,
                'value_variabels' => $dataSeries100New,
                'value_variabels_rate' => $dataSeries4New
              ]
            );
            $dataSeries100 = [];
            $dataSeries4 = [];
            $dataCategories = [];

            $stateMatkul = $value['code'];
            $stateMatkulName = $value['matkulname'];

            array_push($dataSeries100, (float)number_format($value['dataCompetencies'][$i]->scale100, 2));
            array_push($dataSeries4, (float)number_format($value['dataCompetencies'][$i]->scale100 / 100 * 4, 2));
            array_push($dataCategories, $value['dataCompetencies'][$i]->competenciesname);
          }
        }
      }
      $dataCategoriesNew = $dataCategories;
      $dataSeries100New = $dataSeries100;
      $dataSeries4New = $dataSeries4;

      array_push($dataCategoriesNew, '');
      array_unshift($dataCategoriesNew, '');
      array_push($dataSeries100New, 0);
      array_unshift($dataSeries100New, 0);
      array_push($dataSeries4New, 0);
      array_unshift($dataSeries4New, 0);

      array_push($arrMatkul[count($getMatkulArray)-1]['detail_value_statistic'], 
        [ 
          'id_detail_value_statistic' =>3, 
          'name' =>"Competencies", 
          'variabels' => $dataCategories,
          'value_variabels' =>$dataSeries4,
          'value_variabels_rate' =>null  
        ]
      );
      array_push($arrMatkul[count($getMatkulArray)-1]['detail_value_statistic'], 
        [ 
          'id_detail_value_statistic' =>4, 
          'name' =>"Competencies Statistic",
          'variabels' => $dataCategoriesNew,
          'value_variabels' => $dataSeries100New,
          'value_variabels_rate' => $dataSeries4New,
          'test' => $onlyTest
        ]
      );
      return response()->json($arrMatkul);
    }

    public function indexMahasiswa(Request $request)
    {
        $matkulNameArr = [];
        $ipk = 0;
        $arrMatkul = [];
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getUniqueCode = AMataKuliah::selectRaw('a_mata_kuliah.unique_code, m_mata_kuliah.name as matkulname, a_mata_kuliah.sks, a_mata_kuliah.mata_kuliah_code')
                                        ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                        ->join('a_mata_kuliah_mahasiswa', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_mahasiswa.a_mata_kuliah_id')
                                        ->join('a_mahasiswa_program_studies', 'a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id', '=', 'a_mahasiswa_program_studies.id')
                                        ->join('m_mahasiswa', 'a_mahasiswa_program_studies.m_mahasiswa_nim', '=', 'm_mahasiswa.nim')
                                        ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                        ->where('m_mahasiswa.nim', 'LIKE', '%'.$request->nim.'%')
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->groupBy('a_mata_kuliah.unique_code', 'm_mata_kuliah.name', 'a_mata_kuliah.sks', 'a_mata_kuliah.mata_kuliah_code')
                                        ->get();

        $dataMhs = [];
        foreach ($getUniqueCode as $key => $valueUniqueCode) {
          $getDataNew = AMataKuliah::selectRaw('m_mahasiswa.name as mhsName, m_mahasiswa.nim as mhsNim, a_mata_kuliah_mahasiswa.presence as kehadiran, 
                                            m_course_works.name as cwname, a_cw_question_mhs.weight, m_mahasiswa.created_at,
                                            a_mata_kuliah.scale_task, a_mata_kuliah.scale_exam, a_mata_kuliah.total_task, a_mata_kuliah.scale_task_detail')
                                ->join('a_mata_kuliah_mahasiswa', 'a_mata_kuliah.id', '=', 'a_mata_kuliah_mahasiswa.a_mata_kuliah_id')
                                ->join('a_mahasiswa_program_studies', 'a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id', '=', 'a_mahasiswa_program_studies.id')
                                ->join('m_mahasiswa', 'a_mahasiswa_program_studies.m_mahasiswa_nim', '=', 'm_mahasiswa.nim')
                                ->leftJoin('a_cw_question_mhs', 'a_mata_kuliah_mahasiswa.id', '=', 'a_cw_question_mhs.a_mata_kuliah_mahasiswa_id')
                                ->leftJoin('a_course_work_questions', 'a_cw_question_mhs.a_cw_question_id', '=', 'a_course_work_questions.id')
                                ->leftJoin('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                                ->where('a_mata_kuliah.unique_code', $valueUniqueCode->unique_code)
                                ->where('m_mahasiswa.nim', 'LIKE', '%'.$request->nim.'%')
                                ->where('a_mata_kuliah.deleted_at', null)
                                ->get();

          $stateMhsName = null;
          $stateMhsNim = null;
          $stateKehadiran = null;
          $stateCw = null;
          $tempWeightTugas = [];
          $tempWeightTugasKey = [];
          $tempWeightUas = 0;
          $totalWeightTugas = 0;
          $totalWeightUas = 0;
          foreach ($getDataNew as $keyGetData => $valueGetData) {
            $scaleTaskDetail = (array)json_decode($valueGetData['scale_task_detail']);
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
                  }else{
                      $tempWeightUas += (float)$valueGetData['weight'];
                      $totalWeightUas += 1;
                  }
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

                      $checkScore = DB::select("
                                          SELECT code
                                          FROM m_score
                                          WHERE float4(min_point) < '".(float)$finalScore."'
                                          AND float4(max_point) >= '".(float)$finalScore."'
                                      ");

                      $dataMhs[$valueUniqueCode->unique_code] = [];
                      array_push($dataMhs[$valueUniqueCode->unique_code], [
                          'uniqueCode' => $valueUniqueCode->unique_code,
                          'grade' => $checkScore[0]->code,
                          'final_score' => $finalScore
                      ]);

                      $tempWeightTugas = 0;
                      $tempWeightUas = 0;
                      $totalWeightTugas = 0;
                      $totalWeightUas = 0;
                      $stateMhsName = $valueGetData['mhsname'];
                      $stateMhsNim = $valueGetData['mhsnim'];
                      $stateKehadiran = $valueGetData['kehadiran'];
                      $stateCw = explode(' ', $valueGetData['cwname'])[0];
                      
                      if (explode(' ', $valueGetData['cwname'])[0] == 'Tugas') {
                        if (! array_key_exists($valueGetData['cwname'],$tempWeightTugas)) {
                            $tempWeightTugas[$valueGetData['cwname']] = 0;
                            array_push($tempWeightTugasKey, $valueGetData['cwname']);
                        }
                        $tempWeightTugas[$valueGetData['cwname']] += (float)$valueGetData['weight'];
                        $totalWeightTugas += 1;
                      }else{
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
          $exam100 = $tempWeightUas;
          $finalScore = (float)($cw100 * (float)$getDataNew[0]['scale_task'] / 100) + ($exam100 * (float)$getDataNew[0]['scale_exam'] / 100);

          $checkScore = DB::select("
            SELECT code, score
            FROM m_score
            WHERE float4(min_point) < '".(float)$finalScore."'
            AND float4(max_point) >= '".(float)$finalScore."'
          ");

          $dataMhs[$valueUniqueCode->unique_code] = [];
          array_push($dataMhs[$valueUniqueCode->unique_code], [
            'uniqueCode' => $valueUniqueCode->unique_code,
            'grade' => $checkScore[0]->code,
            'score' => $checkScore[0]->score,
            'final_score' => $finalScore
          ]);
        }

        $ipk = 0;
        $totalIp = 0;
        $totalSks = 0;
        foreach ($getUniqueCode as $key => $value) {
          $totalIp += ((float)$dataMhs[$value->unique_code][0]['score'] * (float)$value->sks);
          $totalSks += (float)$value->sks;
          array_push($matkulNameArr, [
            'name' => $value->matkulname,
            'kode_matkul' => $value->mata_kuliah_code,
            'sks' => $value->sks,
            'grade' => $dataMhs[$value->unique_code][0]['grade'],
            'test' => $dataMhs[$value->unique_code][0]['final_score']
          ]);
        }

        $ipk = (float)number_format($totalIp / $totalSks, 2);

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
                  AND amps.m_mahasiswa_nim LIKE '%".str_replace(' ', '', $request->nim)."%'
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

        array_push($arrMatkul, [
          'id_value_statistic' => null, 
          'name' =>$matkulNameArr,
          'ipk' => $ipk,
          'detail_value_statistic' =>[
            [ 
              'id_detail_value_statistic' =>1, 
              'name' =>"Competencies", 
              'variabels' => $dataCategoriesCpls,
              'value_variabels' =>$dataSeriesCpls,
              'value_variabels_rate' =>null  
            ],
            [ 
              'id_detail_value_statistic' =>2, 
              'name' =>"Competencies Statistic",
              'variabels' => $dataCategories,
              'value_variabels' => $dataSeries100,
              'value_variabels_rate' => $dataSeries4
            ]
          ] 
        ]);

        $arrMatkulGetData = null;
        $arrMatkulGetDataFinal = null;
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
                    AND amps.m_mahasiswa_nim LIKE '%".str_replace(' ', '', $request->nim)."%'
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

      array_unshift($arrMatkul[0]['detail_value_statistic'], 
        [ 
          'id_detail_value_statistic' =>3, 
          'name' =>"CPL", 
          'variabels' => $dataCategoriesCpls,
          'value_variabels' =>$dataSeriesCpls,
          'value_variabels_rate' =>null
        ]
      );
      array_unshift($arrMatkul[0]['detail_value_statistic'], 
        [ 
          'id_detail_value_statistic' =>4, 
          'name' =>"CPL Statistic", 
          'variabels' => $dataCategories,
          'value_variabels' => $dataSeries100,
          'value_variabels_rate' => $dataSeries4,
          // 'test' => array_unique($getUniqueCode, 0)
        ]
      );

      return response()->json($arrMatkul);
    }

    public function indexMataKuliah(Request $request)
    {
      $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

      $getMatkul = AMataKuliah::selectRaw('a_mata_kuliah.id, m_mata_kuliah.code, m_mata_kuliah.name as matkulname')
                              ->join('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                              ->where('a_mata_kuliah.id', $request->matkulId)
                              ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                              ->where('a_mata_kuliah.deleted_at', null)
                              ->first();

      $stateMatkul = $getMatkul->code;
      $stateMatkulName = $getMatkul->matkulname;
      $arrMatkul = [];

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
                AND amk.mata_kuliah_code = '".$getMatkul->code."'
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
                AND amk.mata_kuliah_code = '".$getMatkul->code."'
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

    array_push($arrMatkul, [
      'id_value_statistic' => $stateMatkul, 
      'name' =>$stateMatkulName, 
      'detail_value_statistic' =>[
        [ 
          'id_detail_value_statistic' =>1, 
          'name' =>"CPLs", 
          'variabels' => $dataCategoriesCpls,
          'value_variabels' =>$dataSeriesCpls,
          'value_variabels_rate' =>null  
        ],
        [ 
          'id_detail_value_statistic' =>2, 
          'name' =>"CPL Statistic", 
          'variabels' => $dataCategories,
          'value_variabels' => $dataSeries100,
          'value_variabels_rate' => $dataSeries4
        ]
      ] 
    ]);

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
              AND amk.mata_kuliah_code = '".$getMatkul->code."'
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
              AND amk.mata_kuliah_code = '".$getMatkul->code."'
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

    array_push($arrMatkul[0]['detail_value_statistic'], 
      [ 
        'id_detail_value_statistic' => 3,
        'name' =>"Competencies", 
        'variabels' => $dataCategoriesCpls,
        'value_variabels' =>$dataSeriesCpls,
        'value_variabels_rate' =>null  
      ]
    );
    array_push($arrMatkul[0]['detail_value_statistic'], 
    [ 
      'id_detail_value_statistic' => 4,
      'name' =>"Competencies Statistic",
      'variabels' => $dataCategories,
      'value_variabels' => $dataSeries100,
      'value_variabels_rate' => $dataSeries4
    ]
    );

    return response()->json($arrMatkul);
  }
}
