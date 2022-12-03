<?php

namespace App\Imports\Prodi;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\MProgramStudy;
use App\Models\AMataKuliahMahasiswa;
use App\Models\AMataKuliahEvaluation;
use App\Models\AMataKuliah;
use Carbon\Carbon;
use App\Imports\Prodi\StateProdi;
use App\Imports\Prodi\StateMhs;
use App\Imports\Prodi\StateUniqueCode;

class GetProdiMatkulEvaluationImport implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        // $getError = StateProdi::getError();

        // if ($getError != null) {
        //     goto skip;
        // }

        $getUniqueCode = StateUniqueCode::getUniqueCode();
        
        $getEvaluation = AMataKuliah::selectRaw('a_mata_kuliah.id, a_mata_kuliah_evaluations.answer, a_mata_kuliah_evaluations.question')
                                                ->leftJoin('a_mata_kuliah_evaluations', 'a_mata_kuliah_evaluations.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                                ->where('a_mata_kuliah.unique_code', $getUniqueCode)
                                                ->get();

        if($getEvaluation[0]['question'] == null) {
                AMataKuliahEvaluation::insert([
                    'a_mata_kuliah_id' => $getEvaluation[0]['id'],
                    'question' => $collection[9][0],
                    'answer' => $collection[10][0]
                ]);
                AMataKuliahEvaluation::insert([
                    'a_mata_kuliah_id' => $getEvaluation[0]['id'],
                    'question' => $collection[27][0],
                    'answer' => (($collection[28][0] == null) ? null : $collection[28][0])
                ]);
                AMataKuliahEvaluation::insert([
                    'a_mata_kuliah_id' => $getEvaluation[0]['id'],
                    'question' => $collection[44][0],
                    'answer' => (($collection[45][0] == null) ? null : $collection[45][0])
                ]);
                AMataKuliahEvaluation::insert([
                    'a_mata_kuliah_id' => $getEvaluation[0]['id'],
                    'question' => $collection[48][0],
                    'answer' => (($collection[49][0] == null) ? null : $collection[49][0])
                ]);
                AMataKuliahEvaluation::insert([
                    'a_mata_kuliah_id' => $getEvaluation[0]['id'],
                    'question' => $collection[50][0],
                    'answer' => (($collection[51][0] == null) ? null : $collection[51][0])
                ]);
        }

        skip:
    }
}
