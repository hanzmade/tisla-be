<?php

namespace App\Imports\Prodi;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Carbon\Carbon;
use App\Imports\Prodi\StateProdi;
use App\Imports\Prodi\StateUniqueCode;
use App\Models\AMataKuliah;
use App\Models\AMataKuliahCpl;
use App\Models\MQuestion;
use App\Models\MCourseWork;
use App\Models\ACourseWorkQuestion;
use App\Models\ACwQuestionCpl;

class CplBobotImport implements ToCollection
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
        $getCplMap = StateProdi::getCplMap();
        $getCompareWeight = StateProdi::getCompareWeight();
        $getUniqueCode = StateUniqueCode::getUniqueCode();

        $checkAMatkul = AMataKuliah::where('unique_code', $getUniqueCode)
                                    ->orderBy('id', 'DESC')
                                    ->first();  
        $getMatkulCpl = AMataKuliahCpl::where('a_mata_kuliah_id', $checkAMatkul->id)->orderBy('id', 'ASC')->get();

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

        $insertCplBobot = [];
        $checkMQuestion = null;
        $insertACwQuestionCpl = [];
        // echo '  ; getmatkulcpl  '. $getMatkulCpl;
        // dd($getCplMap);

        for ($l=2; $l <= 73; $l++) {
            // array_push($compareWeight, $collection[3][$l]);
            if ($getCompareWeight[$l-2] != $collection[3][$l]) {
                $this->messages = 'Bobot Maksimal CPL tidak sama dengan CPMK di kolom ke - ' . $l + 1;
                goto error;
            }
        }

        try {
            for ($m=4; $m < (count($getMatkulCpl) + 4); $m++) {
                $validateCpl = true;
                for ($n=0; $n < count($newArrayBobot[$m]); $n++) {
                    next:
                    try {
                        $setCurrentIndex = $arrIndexTugas[$stateIndex];
                    } catch (\Throwable $th) {
                        //throw $th;
                    }
                    try {
                        $setNextIndex = $arrIndexTugas[$stateIndex + 1];
                    } catch (\Throwable $th) {}

                    $currentIndex = $n - $setCurrentIndex+1;
                    $nextIndex = $n - $setNextIndex+1;

                    if ($currentIndex >= 8 && $stateIndex == 8) {
                        $stateIndex = 0;
                    }

                    if ($nextIndex > 0) {
                        $stateIndex ++;
                        goto next;
                    }

                    // echo 'current index : ' . $currentIndex;
                    // echo 'next index : ' . $nextIndex;

                    // echo '  <<<< state index : ' . $stateIndex . ' >>>>>> ';
                
                    if ($stateIndex <= 7 && $currentIndex > 0 && $currentIndex < 9) {
                        $checkMQuestion = MQuestion::where('name', 'LIKE', '%P' . $currentIndex .'%')->first();

                        $checkMCW = MCourseWork::where('name', 'LIKE', '%Tugas ' . ((int)$stateIndex + 1) .'%')->first();

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

                        $checkACWQuestionCpl = ACwQuestionCpl::where('a_cw_question_id', $checkACourseWorkQuestion->id)
                                                                ->where('a_mata_kuliah_cpl_id', $getMatkulCpl[$m-4]->id)
                                                                ->first();
                                                                
                        if ($checkACWQuestionCpl == null && $newArrayBobot[$m][$n] != null) {
                            try {
                                foreach ($getCplMap as $keyCplRef => $valueCplRef) {
                                    if($collection[$m][$n] != null && $valueCplRef[$m-3] != null) {
                                        goto skipExit;
                                    }else if ($collection[$m][$n] == null){
                                        goto skipExit;
                                    }
                                }
                                $this->messages = 'CPL Bobot anda tidak match dengan mapping di sheet CPL Bobot baris ke-' .($m + 1). ' kolom ke-'.($n + 1). '   data :  ' . $collection[$m][$n];
                                goto error;

                                skipExit:

                            } catch (\Throwable $th) {
                                dump($th);
                            }

                            $data = [
                                'a_mata_kuliah_cpl_id' => $getMatkulCpl[$m-4]->id,
                                'a_cw_question_id' => $checkACourseWorkQuestion->id,
                                'weight' => (($newArrayBobot[$m][$n] == ' ') ? 0 : $newArrayBobot[$m][$n])
                            ];

                            array_push($insertACwQuestionCpl, $data);
                        }

                    }else if($currentIndex > 0 && $currentIndex < 9 && $stateIndex == 8){
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

                        $checkACWQuestionCpl = ACwQuestionCpl::where('a_cw_question_id', $checkACourseWorkQuestion->id)
                                                                ->where('a_mata_kuliah_cpl_id', $getMatkulCpl[$m-4]->id)
                                                                ->first();

                        if ($checkACWQuestionCpl == null && $newArrayBobot[$m][$n] != null) {
                            try {
                                foreach ($getCplMap as $keyCplRef => $valueCplRef) {
                                    if($collection[$m][$n] != null && $valueCplRef[$m-3] != null) {
                                        goto skipExit2;
                                        // dump('129 : ');
                                    }else if ($collection[$m][$n] == null){
                                        goto skipExit2;
                                        // dump('131 : ');
                                    }
                                }
                                $this->messages = 'CPL Bobot anda tidak match dengan mapping di sheet CPL Bobot baris ke-' .($m + 1). ' kolom ke-'.($n + 1). '   data :  ' . $collection[$m][$n];
                                goto error;

                                skipExit2:

                            } catch (\Throwable $th) {
                                dump($th);
                            }

                            $data = [
                                'a_mata_kuliah_cpl_id' => $getMatkulCpl[$m-4]->id,
                                'a_cw_question_id' => $checkACourseWorkQuestion->id,
                                'weight' => (($newArrayBobot[$m][$n] == ' ') ? 0 : $newArrayBobot[$m][$n])
                            ];

                            array_push($insertACwQuestionCpl, $data);
                            // dump($insertACwQuestionCpl);
                        }
                    }
                }
            }

            $insertACwQuestionCpl = collect($insertACwQuestionCpl);

            $chunksCwQuestCpl = $insertACwQuestionCpl->chunk(20);
            foreach ($chunksCwQuestCpl as $chunkCwQuestCpl)
            {
                ACwQuestionCpl::insert($chunkCwQuestCpl->toArray());
            } 
        } catch (Exception $th) {
            exit($th);
        }
    }
}
