<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\MDosen;
use App\Models\ADosenProgramStudy;
use App\Models\MDosenEducation;
use Carbon\Carbon;
use App\Imports\State;

class DosenSheetImport implements ToCollection
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
        $insertDataProdi = [];
        $insertDataEducation = [];
        $getProdi = State::get();
        
        for ($i=1; $i < $totalRow; $i++) {
            $getExistingDosen = MDosen::where('nidn', 'LIKE', '%'.$dataArr[$i][2].'%')->first();
            if ($getExistingDosen != null) {
                goto skipDosen;
            }

            $data = [
                'name' => $dataArr[$i][1],
                'nidn' => str_replace(' ', '', $dataArr[$i][2]),
                'jfa' => $dataArr[$i][3],
                'science' => $dataArr[$i][4],
                'taught_courses' => $dataArr[$i][5],
                'image_url' => $dataArr[$i][10],
                'gs_url' => $dataArr[$i][11],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];

            $dataProdi = [
                'm_dosen_nidn' => str_replace(' ', '', $dataArr[$i][2]),
                'm_program_study_id' => $getProdi,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];



            for ($j=6; $j <=9 ; $j++) { 
                if (strlen($dataArr[$i][$j]) > 0) {
                    array_push($insertDataEducation, [
                        'm_dosen_nidn' => $dataArr[$i][2],
                        'education' => $dataArr[$i][$j],
                        'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                    ]);
                }
            }

            array_push($insertData, $data);
            array_push($insertDataProdi, $dataProdi);

            skipDosen:
        }

        $insertData = collect($insertData);
        $insertDataEducation = collect($insertDataEducation);
        $insertDataProdi = collect($insertDataProdi);

        $chunks = $insertData->chunk(20);
        $chunksEducation = $insertDataEducation->chunk(20);
        $chunksProdi = $insertDataProdi->chunk(20);
        
        foreach ($chunks as $chunk)
        {
            MDosen::insert($chunk->toArray());
        }
        
        foreach ($chunksEducation as $chunkEducation)
        {
            MDosenEducation::insert($chunkEducation->toArray());
        }
        
        foreach ($chunksProdi as $chunkProdi)
        {
            ADosenProgramStudy::insert($chunkProdi->toArray());
        }
    }
}
