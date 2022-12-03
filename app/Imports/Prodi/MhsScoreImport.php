<?php

namespace App\Imports\Prodi;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Imports\Prodi\StateProdi;
use App\Imports\Prodi\StateMhs;
use App\Imports\Prodi\StateUniqueCode;
use App\Models\AMataKuliahMahasiswa;
use App\Models\AMahasiswaProgramStudy;
use App\Models\AMataKuliah;
use App\Models\MQuestion;
use App\Models\MCourseWork;
use App\Models\ACourseWorkQuestion;
use App\Models\ACwQuestionMhs;
use Carbon\Carbon;

class MhsScoreImport implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        // dd($collection->toArray());
        goto skipError;
        
        error:
        $deleteAMataKuliah = AMataKuliah::where('unique_code', $getUniqueCode)
                                        ->update([
                                            'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                        ]);

        header('HTTP/1.1 500 Internal Server Error', true, 500);
        trigger_error($this->messages, E_USER_ERROR);
        // dd($this->messages);

        skipError:
        // echo $collection;
        // goto skip;
        $getStateProdi = StateProdi::getProdi();
        $getStateMatkul = StateProdi::getMatkul();
        $getStateSemester = StateProdi::getSemester();
        $getError = StateProdi::getError();
        $getStateMhs = StateMhs::getNim();
        $getUsedIndex = StateMhs::getUsedIndex();
        $getUnusedIndex = StateMhs::getUnusedIndex();
        $getTotalMhs = StateMhs::getTotalMhs();
        $getUniqueCode = StateUniqueCode::getUniqueCode();
        $getCompareWeight = StateProdi::getCompareWeight();

        // dump($getCompareWeight);

        $checkAMatkul = AMataKuliah::where('unique_code', $getUniqueCode)
                                    ->orderBy('id', 'DESC')
                                    ->first();

        $getMatkulMhs = AMataKuliahMahasiswa::selectRaw('a_mata_kuliah_mahasiswa.*, a_mahasiswa_program_studies.m_mahasiswa_nim')
                                            ->join('a_mahasiswa_program_studies', 'a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id', '=', 'a_mahasiswa_program_studies.id')
                                            ->where('a_mata_kuliah_mahasiswa.a_mata_kuliah_id', $checkAMatkul->id)->orderBy('id', 'ASC')->get();

        if (count($getMatkulMhs) == 0) {
            foreach ($getStateMhs as $keyMhs => $valueMhs) {
                $getMhsProdi = AMahasiswaProgramStudy::where('m_mahasiswa_nim', 'like', '%'.$valueMhs.'%')->first();

                if ($getMhsProdi != null) {
                    AMataKuliahMahasiswa::insert([
                        'a_mata_kuliah_id' => $checkAMatkul->id,
                        'a_mahasiswa_program_study_id' => $getMhsProdi['id'],
                        'created_at' => Carbon::now()->format('Y-m-d')
                    ]);
                }

            }
            $getMatkulMhs = AMataKuliahMahasiswa::selectRaw('a_mata_kuliah_mahasiswa.*, a_mahasiswa_program_studies.m_mahasiswa_nim')
                                                ->join('a_mahasiswa_program_studies', 'a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id', '=', 'a_mahasiswa_program_studies.id')
                                                ->where('a_mata_kuliah_mahasiswa.a_mata_kuliah_id', $checkAMatkul->id)->orderBy('id', 'ASC')->get();
        }

        // Get Tugas
        $arrIndexTugas = [];
        $newArrTugas = array_filter(json_decode($collection)[1]);

        $newIndex = -1;
        foreach ($newArrTugas as $key => $value) {
            $newIndex++;
            if ($value != 'Asesmen') {
                array_push($arrIndexTugas, $key);
            }
        }

        // // echo implode(';',$arrIndexTugas);

        // // $newArrayBobot = json_decode($collection);
        array_push($arrIndexTugas, $arrIndexTugas[count($arrIndexTugas)-1]+10);
        // // echo json_encode($newArrayBobot);
        $stateIndex = 1;
        $setCurrentIndex = 0;
        $setNextIndex = 0;

        $insertCplBobot = [];
        $checkMQuestion = null;

        $insertACwQuestionMhs = [];
        $currentIndex = 1;
        $checkMQuestion = [];
        $checkMCW = [];
        $checkACourseWorkQuestion = [];
        $checkACWQuestionMhs = [];
        $tempMCW = [];
        $tempMQuestion = [];
        $tempGetMatkulMhs = [];
        $tempGetNimMhs = [];
        $MQuestion = MQuestion::whereIn('name', ['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P7', 'P8'])->get();
        $MCW = MCourseWork::whereIn('name', ['Tugas 1', 'Tugas 2', 'Tugas 3', 'Tugas 4', 'Tugas 5', 'Tugas 6', 'Tugas 7', 'Tugas 8', 'UAS'])->get();
        
        foreach ($MQuestion as $keyMQuestion => $valueMQuestion) {
            array_push($tempMQuestion, $valueMQuestion['id']);
        }
        foreach ($MCW as $keyMCW => $valueMCW) {
            array_push($tempMCW, $valueMCW['id']);
        }

        $ACourseWorkQuestion = ACourseWorkQuestion::whereIn('course_work_id', $tempMCW)
                                                        ->whereIn('question_id', $tempMQuestion)
                                                        ->get();
        // dd($tempMQuestion);
        foreach ($getMatkulMhs as $keyMatkulMhs => $valueMatkulMhs) {
            array_push($tempGetMatkulMhs, $valueMatkulMhs['id']);
            array_push($tempGetNimMhs, str_replace('   ', '', $valueMatkulMhs['m_mahasiswa_nim']));
        }

        $ACWQuestionMhs = ACwQuestionMhs::whereIn('a_mata_kuliah_mahasiswa_id', $tempGetMatkulMhs)
                                                ->get();
        // dd($MCW);
        $lastStateIndex = 0;
        $selfIndex = 0;
        // dump($getUsedIndex);
        if ($getUsedIndex == null) {
            $getUsedIndex = [];
        }
        for ($m=4; $m < ($getTotalMhs + 4); $m++) {
            // dump($tempGetNimMhs);
            try {
                $getSelectedMhs = (int)$tempGetNimMhs[$selfIndex];
            } catch (\Throwable $th) {
                //throw $th;
            }
            if (! in_array($getSelectedMhs.'', $getUsedIndex)) {
                goto skipWeight;
            }
            $getKey = array_search($getSelectedMhs, $getUsedIndex);
            // dump($getKey);
            
            // dump($getKey);

            if($lastStateIndex != $m){
                $lastStateIndex = $m;
                $currentIndex = 1;
            }

            for ($n=3; $n < 85; $n++) {
                $checkACWQuestionMhs = null;
                if ($currentIndex >= 9) {
                    $stateIndex ++;
                    $currentIndex = 1;
                    if ($stateIndex > 9) {
                        $stateIndex = 1;
                    }
                    goto next;
                }

                if ($stateIndex <= 8 && $currentIndex > 0 && $currentIndex < 9) {
                    foreach ($MQuestion as $keyMQuestion => $valueMQuestion) {
                        if ($valueMQuestion['name'] == 'P'.$currentIndex) {
                            $checkMQuestion = $valueMQuestion;
                        }
                    }
                    foreach ($MCW as $keyMCW => $valueMCW) {
                        if ($valueMCW['name'] == 'Tugas '.$stateIndex) {
                            $checkMCW = $valueMCW;
                        }
                    }

                    $checkACourseWorkQuestion = ACourseWorkQuestion::selectRaw('a_course_work_questions.id')
                                                                    ->join('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                                                                    ->join('m_questions', 'a_course_work_questions.question_id', '=', 'm_questions.id')
                                                                    ->where('m_course_works.name', 'LIKE', '%Tugas '.$stateIndex.'%')
                                                                    ->where('m_questions.name', 'LIKE', '%P'.$currentIndex.'%')
                                                                    ->first();

                    foreach ($ACWQuestionMhs as $keyCWQuestionMhs => $valueCWQuestionMhs) {
                        if ($valueCWQuestionMhs['a_cw_question_id'] == $checkACourseWorkQuestion['id'] && $valueCWQuestionMhs['a_mata_kuliah_mahasiswa_id'] == $tempGetMatkulMhs[$m-4]) {
                            $checkACWQuestionMhs = $valueCWQuestionMhs;
                        }
                    }
                    // dump($collection($getKey + 4));
                    if ($checkACWQuestionMhs == null && $collection[$getKey + 4][$n] != null && substr_count($collection[$getKey + 4][$n], '=SUM') < 1) {
                        try {
                            if ($getCompareWeight[($n-3-($stateIndex-1))] < (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n])) {
                                // dump(($n-3-($stateIndex-1)) . ' || ' . $getCompareWeight[($n-3-($stateIndex-1))] . ' || ' . (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n]));
                                $this->messages = 'Bobot Mahasiswa lebih besar dari maksimal bobot di sheet Rekap Asesmen baris ke-' .($m + 1). ' kolom ke-'.($n + 1)  . '  ||  ' . json_encode($getCompareWeight) . ' |  Data : ' . (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n]);
                                goto error;
                            }

                            $data = [
                                'a_mata_kuliah_mahasiswa_id' => $tempGetMatkulMhs[$selfIndex],
                                'a_cw_question_id' => $checkACourseWorkQuestion['id'],
                                'weight' => (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n])
                            ];
    
                            array_push($insertACwQuestionMhs, $data);
                            //code...
                        } catch (\Throwable $th) {
                            //throw $th;
                        }
                    }
                    $currentIndex++ ;

                }else if($currentIndex > 0 && $currentIndex < 9 && $stateIndex == 9){
                    foreach ($MQuestion as $keyMQuestion => $valueMQuestion) {
                        if ($valueMQuestion['name'] == 'P'.$currentIndex) {
                            $checkMQuestion = $valueMQuestion;
                        }
                    }
                    foreach ($MCW as $keyMCW => $valueMCW) {
                        if ($valueMCW['name'] == 'UAS') {
                            $checkMCW = $valueMCW;
                        }
                    }

                    $checkACourseWorkQuestion = ACourseWorkQuestion::selectRaw('a_course_work_questions.id')
                                                                    ->join('m_course_works', 'a_course_work_questions.course_work_id', '=', 'm_course_works.id')
                                                                    ->join('m_questions', 'a_course_work_questions.question_id', '=', 'm_questions.id')
                                                                    ->where('m_course_works.name', 'LIKE', '%UAS%')
                                                                    ->where('m_questions.name', 'LIKE', '%P'.$currentIndex.'%')
                                                                    ->first();

                    foreach ($ACWQuestionMhs as $keyCWQuestionMhs => $valueCWQuestionMhs) {
                        if ($valueCWQuestionMhs['a_cw_question_id'] == $checkACourseWorkQuestion['id'] && $valueCWQuestionMhs['a_mata_kuliah_mahasiswa_id'] == $tempGetMatkulMhs[$m-4]) {
                            $checkACWQuestionMhs = $valueCWQuestionMhs;
                        }
                    }

                    if ($checkACWQuestionMhs == null && $collection[$getKey + 4][$n] != null && substr_count($collection[$getKey + 4][$n], '=SUM') < 1) {
                        try {
                            if ($getCompareWeight[($n-3-($stateIndex-1))] < (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n])) {
                                // dump(($n-3-($stateIndex-1)) . ' || ' . $getCompareWeight[($n-3-($stateIndex-1))] . ' || ' . (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n]));
                                $this->messages = 'Bobot Mahasiswa lebih besar dari maksimal bobot di sheet Rekap Asesmen baris ke-' .($m + 1). ' kolom ke-'.($n + 1) . '  ||  ' . json_encode($getCompareWeight) . ' ||  Data : ' . (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n]);
                                goto error;
                            }

                            $data = [
                                'a_mata_kuliah_mahasiswa_id' => $tempGetMatkulMhs[$selfIndex],
                                'a_cw_question_id' => $checkACourseWorkQuestion['id'],
                                'weight' => (($collection[$getKey + 4][$n] == ' ') ? 0 : $collection[$getKey + 4][$n])
                            ];
    
                            array_push($insertACwQuestionMhs, $data);
                        } catch (\Throwable $th) {
                            //throw $th;
                        }
                    }
                    $currentIndex++;
                }
                next:
            }
            
            $selfIndex++;

            skipWeight:

        }

        $insertACwQuestionMhs = collect($insertACwQuestionMhs);

        $chunksACwQuestionMhs = $insertACwQuestionMhs->chunk(20);
        foreach ($chunksACwQuestionMhs as $chunkACwQuestionMhs)
        {
            ACwQuestionMhs::insert($chunkACwQuestionMhs->toArray());
        }
        // dd('stop');
        skip:
    }
}
