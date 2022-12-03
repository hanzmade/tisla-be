<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\MMahasiswa;
use App\Models\AMahasiswaProgramStudy;
use App\Models\MProgramStudy;
use Carbon\Carbon;
use App\Imports\State;

class MahasiswaSheetImport implements ToCollection
{
    protected $incr = 0;
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        $totalRow = count(json_decode($collection)) - 1;
        $dataArr = json_decode($collection);
        $insertData = [];
        $insertDataAMahasiswa = [];
        
        checkAgain:
        $checkExistingProdi = MProgramStudy::where('name','like','%'.$dataArr[1][10].'%')->first();

        $setState = new State($checkExistingProdi['id']);

        if ($checkExistingProdi == null) {
            $insertProdi = MProgramStudy::insert([
                'name' => $dataArr[1][10],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);

            goto checkAgain;
        }
        
        for ($i=1; $i < $totalRow; $i++) {
            $existingMahasiswa = MMahasiswa::where('nim', 'LIKE', "'%".str_replace(' ', '', $dataArr[$i][1])."%'")->first();
            if ($existingMahasiswa != null) {
                goto skipMahasiswa;
            }

            $data = [
                'nim' => str_replace(' ', '', $dataArr[$i][1]),
                'name' => $dataArr[$i][2],
                'curriculum' => $dataArr[$i][3],
                'graduate_of' => $dataArr[$i][4],
                'class' => $dataArr[$i][5],
                'college_status' => $dataArr[$i][6],
                'year_of_entry' => $dataArr[$i][7],
                'tk' => $dataArr[$i][8],
                'hk' => $dataArr[$i][9],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];

            $dataAMahasiswa = [
                'm_mahasiswa_nim' => str_replace(' ', '', $dataArr[$i][1]),
                'm_program_study_id' => $checkExistingProdi['id'],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];

            array_push($insertData, $data);
            array_push($insertDataAMahasiswa, $dataAMahasiswa);

            skipMahasiswa:
            
            // echo (' ' . ((int)$i / (int)$totalRow) * 100);
        }

        $insertData = collect($insertData);
        $insertDataAMahasiswa = collect($insertDataAMahasiswa);

        $chunks = $insertData->chunk(500);
        $chunksAMahasiswa = $insertDataAMahasiswa->chunk(500);
        
        foreach ($chunks as $chunk)
        {
            MMahasiswa::insert($chunk->toArray());
        }
        
        foreach ($chunksAMahasiswa as $chunkAMahasiswa)
        {
            AMahasiswaProgramStudy::insert($chunkAMahasiswa->toArray());
        }
    }
}
