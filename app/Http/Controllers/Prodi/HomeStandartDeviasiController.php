<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MCpmk;
use App\Models\MCourseWork;
use App\Models\AMataKuliah;
use App\Models\AMataKuliahCpmk;
use App\Models\AUserProgramStudy;
use App\Models\MScore;
use App\Models\ACwQuestionCpmk;
use App\Models\ACwQuestionMhs;
use App\Models\ACwQuestionCpl;
use App\Models\ACplCompetency;
use App\Models\AMataKuliahEvaluation;
use DB;

class HomeStandartDeviasiController extends Controller
{
    public function index(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();
      
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
                code, scale100, scale4
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
            ORDER BY code ASC
        ";

        $getDataTemp = DB::select(DB::raw($arrMatkulGetData));

        $stateCode = null;
        // $getData['keys'] = [];
        // foreach ($getDataTemp as $keyGetDataTemp => $valueGetDataTemp) {
        //     array_push($getData['keys'], $valueGetDataTemp->code);

        //     $getData[$valueGetDataTemp->code]['datacplrate100'] = (float)$valueGetDataTemp->scale100;
        //     $getData[$valueGetDataTemp->code]['datacplrate4'] = (float)$valueGetDataTemp->scale4;
        //     $getData[$valueGetDataTemp->code]['count'] = 1;

        // }

        $dataCode = [];
        $dataTempCpl = [];
        $stateCpl = null;
        $listHeader = [
            [
                'id' => 1,
                'field' => 'avg',
                'name' => 'Average Total'
            ]
        ];
        $listNilaiMax = [
            [
                'id' => 1,
                'field' => 'Standard Deviation',
                'name' => 'nilai_standar'
            ]
        ];

        foreach ($getDataTemp as $key => $value) {
            if ($value->code != $stateCpl) {
                array_push($dataCode, $value->code);
                if($stateCpl != null){
                    // dump($key);
                    $getSD = $this->standartDeviation($dataTempCpl);
                    $average = 0;
                    foreach ($dataTempCpl as $keyAvg => $valueAvg) {
                        $average += (int)$valueAvg;
                    }
                    array_push($listHeader,[
                        'id' => count($listHeader) + 1,
                        'field' => strtolower($stateCpl),
                        'name' => number_format($average / ((count($dataTempCpl) == 0) ? 1 : count($dataTempCpl)), 2)
                    ]);
                    array_push($listNilaiMax,[
                        'id' => count($listHeader) + 1,
                        'field' => number_format($getSD, 2),
                        'name' => 'nilai_standar_'.strtolower($stateCpl)
                    ]);
                }

                $stateCpl = $value->code;

                $dataTempCpl = [];

                array_push($dataTempCpl, $value->scale100);
            }else{
                array_push($dataTempCpl, $value->scale100);
            }
        }

        $getSD = $this->standartDeviation($dataTempCpl);
        // dd($getDataTemp);
        $average = 0;
        foreach ($dataTempCpl as $keyAvg => $valueAvg) {
            $average += (int)$valueAvg;
        }
        array_push($listHeader,[
            'id' => count($listHeader) + 1,
            'field' => strtolower($stateCpl),
            'name' => number_format($average / count($dataTempCpl), 2)
        ]);
        array_push($listNilaiMax,[
            'id' => count($listHeader) + 1,
            'field' => number_format($getSD, 2),
            'name' => 'nilai_standar_'.strtolower($stateCpl)
        ]);


        $listTitle = [
            [
                'id' => 1,
                'field' => 'name',
                'name' => 'Name'
            ]
        ];
        // dd($dataCode);
        $dataCode = array_unique($dataCode);
        sort($dataCode);
        foreach ($dataCode as $key => $value) {
            array_push($listTitle, [
                'id' => $key + 2,
                'field' => strtolower($value),
                'name' => $value
            ]);
        }

        // dd($listNilaiMax);

        return response()->json([
            'id' =>'cw_cpl1',
            'title' =>'COURSE WORK 1 | TUGAS 1',
            'list_title' => $listTitle,
            'list_headers' => $listHeader,
            'list_nilai_max' => $listNilaiMax

        ]);
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
          
        return number_format((float)sqrt($variance/(($num_of_elements == 0) ? 1 : $num_of_elements)),2);
    }
}
