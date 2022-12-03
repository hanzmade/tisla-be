<?php

namespace App\Imports\Prodi;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\MMataKuliah;
use App\Models\AMataKuliah;
use App\Models\MCurriculum;
use App\Models\MProgramStudy;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;

class MatkulImport implements ToCollection
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
        $insertDataAMatkul = [];

        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();
        // dd(auth()->user()->id);
        $codeProdi = MProgramStudy::where('id',$getProdi->program_study_id)->first();

        $checkCurriculum = MCurriculum::where('code', $dataArr[1][2])->first();
        if ($checkCurriculum == null) {
            MCurriculum::insert([
                'code' => $dataArr[1][2]
            ]);
        }
        
        for ($i=1; $i < $totalRow; $i++) {
            $data = [
                'code' => $dataArr[$i][1],
                'name' => $dataArr[$i][3],
                'status' => $dataArr[$i][6],
                'paket' => $dataArr[$i][7],
                'rapem' => $dataArr[$i][8],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];

            $checkMatkul = MMataKuliah::where('code', $dataArr[$i][1])->first();

            if ($checkMatkul == null) {
                array_push($insertData, $data);
            }

            $checkAMatkul = AMataKuliah::where('master_id', $getProdi->program_study_id)
                                        ->where('mata_kuliah_code', $dataArr[$i][1])
                                        ->where('type', 'p')
                                        ->first();

            if ($checkAMatkul == null) {
                if (substr($dataArr[$i][1],1,2) == $codeProdi->code) {
                    $dataAMatkul = [
                        'mata_kuliah_code' => $dataArr[$i][1],
                        'master_id' => $getProdi->program_study_id,
                        'm_curriculum_code' => $checkCurriculum['id'],
                        'sks' => $dataArr[$i][4],
                        'semester' => $dataArr[$i][5],
                        'type' => 'p',
                        'm_class_code' => null,
                        'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                    ];
                    array_push($insertDataAMatkul, $dataAMatkul);
                }

            }

        }

        $insertData = collect($insertData);
        $insertDataAMatkul = collect($insertDataAMatkul);

        $chunks = $insertData->chunk(20);
        $chunksDataAMatkul = $insertDataAMatkul->chunk(20);
        
        foreach ($chunks as $chunk)
        {
            MMataKuliah::insert($chunk->toArray());
        }
        
        foreach ($chunksDataAMatkul as $chunkDataAMatkul)
        {
            AMataKuliah::insert($chunkDataAMatkul->toArray());
        }
    }
}
