<?php

namespace App\Imports\Prodi;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Carbon\Carbon;
use App\Imports\Prodi\StateProdi;
use App\Imports\Prodi\StateUniqueCode;
use App\Models\AMataKuliah;
use App\Models\AMataKuliahCpmk;
use App\Models\MQuestion;
use App\Models\MCourseWork;
use App\Models\ACourseWorkQuestion;
use App\Models\ACwQuestionCpmk;

class CpmkBobotImport implements ToCollection
{
    protected $messages = null;
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        goto skipError;
        
        error:

        $deleteAMataKuliah = AMataKuliah::where('unique_code', $getUniqueCode)
                                        ->update([
                                            'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                        ]);

        header('HTTP/1.1 500 Internal Server Error', true, 500);
        trigger_error($this->messages, E_USER_ERROR);

        skipError:

        $getStateProdi = StateProdi::getProdi();
        $getStateMatkul = StateProdi::getMatkul();
        $getStateSemester = StateProdi::getSemester();
        $getUniqueCode = StateUniqueCode::getUniqueCode();
        $getCpmkBobot = StateCpmkBobot::getBobot();
        $getCpmkMap = StateProdi::getCpmkMap();

        // dd($getCpmkMap);

        $checkAMatkul = AMataKuliah::where('unique_code', $getUniqueCode)
                                    ->orderBy('id', 'DESC')
                                    ->first();  
        $getMatkulCpmk = AMataKuliahCpmk::where('a_mata_kuliah_id', $checkAMatkul->id)->orderBy('id', 'ASC')->get();

        // Get Tugas
        $arrIndexTugas = [];
        $newArrTugas = array_filter(json_decode($collection)[1]);

        $newIndex = -1;
        foreach ($newArrTugas as $key => $value) {
            $newIndex++;
            if ($value != 'Asesmen') {
                array_push($arrIndexTugas, $key);
                if ($newIndex < count($newArrTugas)-1) {
                    // echo '  Tugas '.$newIndex;
                }else{
                    // echo '   UAS';
                }
            }
        }

        // echo implode(';',$arrIndexTugas);

        $newArrayBobot = json_decode($collection);
        array_push($arrIndexTugas, $arrIndexTugas[count($arrIndexTugas)-1]+10);
        // echo json_encode($newArrayBobot);
        $stateIndex = 0;
        $setCurrentIndex = 0;
        $setNextIndex = 0;

        $insertCpmkBobot = [];
        $checkMQuestion = null;

        $checkMCW = MCourseWork::where('name', 'LIKE', 'UAS')->first();
        if ($checkMCW == null) {
            MCourseWork::insert([
                'name' => 'UAS',
                'created_at' => Carbon::now()->format('Y-m-d')
            ]);
        }

        $insertDataMCW = [];
        $insertDataMQuestion = [];

        for ($mcw=1; $mcw <= 8; $mcw++) { 
            $checkMCW = MCourseWork::where('name', 'LIKE', '%Tugas ' . $mcw .'%')->first();
            
            if ($checkMCW == null) {
                $dataMCW = [
                    'name' => 'Tugas '.$mcw,
                    'created_at' => Carbon::now()->format('Y-m-d')
                ];

                array_push($insertDataMCW, $dataMCW);
            }

            $checkMQuestion = MQuestion::where('name', 'LIKE', '%P' . $mcw .'%')->first();
            if ($checkMQuestion == null) {
                $dataMQuestion = [
                    'name' => 'P'. $mcw,
                    'created_at' => Carbon::now()->format('Y-m-d')
                ];
                array_push($insertDataMQuestion, $dataMQuestion);
            }
        }
        
        $insertDataMCW = collect($insertDataMCW);
        $insertDataMQuestion = collect($insertDataMQuestion);

        $chunksMCW = $insertDataMCW->chunk(20);
        $chunksMQuestion = $insertDataMQuestion->chunk(20);
        foreach ($chunksMCW as $chunkMCW)
        {
            MCourseWork::insert($chunkMCW->toArray());
        }
        foreach ($chunksMQuestion as $chunkMQuestion)
        {
            MQuestion::insert($chunkMQuestion->toArray());
        }

        $insertACwQuestionCpmk = [];

        $compareWeight = [];
        for ($l=2; $l <= 73; $l++) { 
            // dump($collection[3][$l]);
            array_push($compareWeight, $collection[3][$l]);
        }
        StateProdi::setCompareWeight($compareWeight);
        // dd('finish');

        try {
            for ($m=4; $m < (8 + 4); $m++) {
                for ($n=0; $n < count($newArrayBobot[$m]); $n++) {
                    // try {
                    //     if($collection[$m][$n+2] != null && $getCpmkMap[$m-4] == null) {
                    //         exit(json_encode([
                    //             'success' => false,
                    //             'message' => 'CPMK Bobot anda tidak match dengan mapping di sheet CONJ Bobot baris ke-' .$m. ' kolom ke-'.$n+2
                    //         ]));
                    //     }
                    // } catch (\Throwable $th) {}

                    try {
        
                        next:
                        try {
                            $setCurrentIndex = $arrIndexTugas[$stateIndex];
                        } catch (\Throwable $th) {
                            //throw $th;
                        }
                        try {
                            $setNextIndex = $arrIndexTugas[$stateIndex + 1];
                        } catch (\Throwable $th) {}

                        $currentIndex = $n - $setCurrentIndex;
                        $nextIndex = $n - $setNextIndex;

                        if ($nextIndex > 0) {
                            $stateIndex ++;
                            goto next;
                        }

                        if ($stateIndex <= 7 && $currentIndex > 0 && $currentIndex < 9) {
                            $checkMQuestion = MQuestion::where('name', 'LIKE', '%P' . $currentIndex .'%')->first();

                            $checkMCW = MCourseWork::where('name', 'LIKE', '%Tugas ' . ((int)$stateIndex + 1) .'%')->first();

                            $checkACourseWorkQuestion = ACourseWorkQuestion::where('course_work_id', $checkMCW->id)
                                                                            ->where('question_id', $checkMQuestion->id)
                                                                            ->first();
                            if ($checkACourseWorkQuestion == null) {
                                // echo 'line 119 : checkACourseWorkQuestion NULL || ';
                                ACourseWorkQuestion::insert([
                                    'course_work_id' => $checkMCW->id,
                                    'question_id' => $checkMQuestion->id,
                                    'created_at' => Carbon::now()->format('Y-m-d')
                                ]);
                                
                                $checkACourseWorkQuestion = ACourseWorkQuestion::where('course_work_id', $checkMCW->id)
                                                                                ->where('question_id', $checkMQuestion->id)
                                                                                ->first();
                            }

                            $checkACWQuestionCpmk = null;

                            try {
                                $checkACWQuestionCpmk = ACwQuestionCpmk::where('a_cw_question_id', $checkACourseWorkQuestion->id)
                                                                        ->where('a_mata_kuliah_cpmk_id', $getMatkulCpmk[$m-4]->id)
                                                                        ->first();
                            } catch (\Throwable $th) {}

                            if ($checkACWQuestionCpmk == null && $newArrayBobot[$m][$n-1] != null) {
                                try {
                                    if(($m-3) <= count($getCpmkMap)) {
                                        goto skipExit;
                                    }
                                    $this->messages = 'Mapping Asesmen anda tidak match dengan mapping di sheet CPMK Bobot baris ke-' .($m + 1). ' kolom ke-'.($n). '   data :  ' . $collection[$m][$n];
                                    goto error;
    
                                    skipExit:
    
                                } catch (\Throwable $th) {
                                    // dump($th);
                                }

                                $data = [
                                    'a_mata_kuliah_cpmk_id' => $getMatkulCpmk[$m-4]->id,
                                    'a_cw_question_id' => $checkACourseWorkQuestion->id,
                                    'weight' => (($newArrayBobot[$m][$n-1] == ' ') ? 0 : $newArrayBobot[$m][$n-1])
                                ];

                                array_push($insertACwQuestionCpmk, $data);
                            }

                        }else if($currentIndex > 0 && $currentIndex < 9 && $stateIndex == 8){
                            // echo 'line 150 : || ';

                            $checkMQuestion = MQuestion::where('name', 'LIKE', '%P' . $currentIndex .'%')->first();

                            $checkMCW = MCourseWork::where('name', 'LIKE', 'UAS')->first();
                            
                            $checkACourseWorkQuestion = ACourseWorkQuestion::where('course_work_id', $checkMCW->id)
                                                                            ->where('question_id', $checkMQuestion->id)
                                                                            ->first();
                            if ($checkACourseWorkQuestion == null) {
                                ACourseWorkQuestion::insert([
                                    'course_work_id' => $checkMCW->id,
                                    'question_id' => $checkMQuestion->id,
                                    'created_at' => Carbon::now()->format('Y-m-d')
                                ]);
                                
                                $checkACourseWorkQuestion = ACourseWorkQuestion::where('course_work_id', $checkMCW->id)
                                                                                ->where('question_id', $checkMQuestion->id)
                                                                                ->first();
                            }

                            $checkACWQuestionCpmk = null;

                            try {
                                $checkACWQuestionCpmk = ACwQuestionCpmk::where('a_cw_question_id', $checkACourseWorkQuestion->id)
                                                                        ->where('a_mata_kuliah_cpmk_id', $getMatkulCpmk[$m-4]->id)
                                                                        ->first();
                            } catch (\Throwable $th) {}
                            // dd($getCpmkMap);
                            if ($checkACWQuestionCpmk == null && $newArrayBobot[$m][$n-1] != null) {
                                try {
                                    if(($m-3) <= count($getCpmkMap)) {
                                        goto skipExit;
                                    }
                                    $this->messages = 'Mapping Asesmen anda tidak match dengan mapping di sheet CPMK Bobot baris ke-' .($m + 1). ' kolom ke-'.($n). '   data :  ' . $collection[$m][$n];
                                    goto error;
    
                                    skipExit2:
    
                                } catch (\Throwable $th) {
                                    // dump($th);
                                }

                                $data = [
                                    'a_mata_kuliah_cpmk_id' => $getMatkulCpmk[$m-4]->id,
                                    'a_cw_question_id' => $checkACourseWorkQuestion->id,
                                    'weight' => (($newArrayBobot[$m][$n-1] == ' ') ? 0 : $newArrayBobot[$m][$n-1])
                                ];

                                array_push($insertACwQuestionCpmk, $data);
                            }

                            $stateIndex = 0;
                        }
                    } catch (\Throwable $th) {
                        echo 'error : ' . $th . '  ||   ';
                    }
                }
            }
            
        } catch (\Throwable $th) {
            exit(json_encode([
                'success' => false,
                'message' => $th
            ]));
        }

        // dump($insertACwQuestionCpmk);
        
        $insertACwQuestionCpmk = collect($insertACwQuestionCpmk);

        $chunksCwQuestCpmk = $insertACwQuestionCpmk->chunk(20);
        foreach ($chunksCwQuestCpmk as $chunkCwQuestCpmk)
        {
            ACwQuestionCpmk::insert($chunkCwQuestCpmk->toArray());
        }
    }
}
