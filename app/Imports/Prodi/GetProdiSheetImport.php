<?php

namespace App\Imports\Prodi;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\MProgramStudy;
use App\Models\AMataKuliahMahasiswa;
use Carbon\Carbon;
use App\Imports\Prodi\StateProdi;
use App\Imports\Prodi\StateMhs;

class GetProdiSheetImport implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        // $dataArr = json_decode($collection);
        $setState = new StateProdi($collection[1][2],$collection[3][2],$collection[5][2],explode('/', $collection[4][2])[1],explode('/', $collection[8][2])[0],explode('/', $collection[4][2])[0], $collection[6][2]);
        // echo 'test aja lah '.  $dataArr[1][2];
        $insertDataIdMhs = [];
        $checkMhs = null;
        // dd($collection);
        for ($i=14; $i < count($collection); $i++) { 
            // echo json_encode($collection[$i][2]);
            if ($collection[$i][2] == null) {
                goto skip;
            }
            try {
                $checkMhs = $collection[$i][2];
            } catch (\Throwable $th) {
                $checkMhs = null;
            }

            if ($checkMhs != null) {
                array_push($insertDataIdMhs, (int)str_replace(' ', '', str_replace('.0', '', ($collection[$i][2]))));
            }
            // dump($insertDataIdMhs);
        }
        // dd('finish');
        skip:
        $setState = new StateMhs($insertDataIdMhs);
    }
}
