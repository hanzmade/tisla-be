<?php

namespace App\Imports\Prodi;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\AMahasiswaProgramStudy;
use App\Models\MMataKuliah;
use App\Models\AMataKuliah;
use App\Models\AMataKuliahCpmk;
use App\Models\AMataKuliahMahasiswa;
use App\Models\MCurriculum;
use App\Models\MMahasiswa;
use App\Models\MCpmk;
use App\Models\MCpl;
use App\Models\ACpmkCpl;
use App\Models\ACplCompetency;
use App\Models\AMataKuliahCpl;
use App\Models\AMataKuliahCompetency;
use App\Models\MProgramStudy;
use App\Models\AUserProgramStudy;
use App\Models\MCompetency;
use App\Imports\Prodi\StateProdi;
use App\Imports\Prodi\StateMhs;
use App\Imports\Prodi\StateUniqueCode;
use App\Imports\Prodi\StateCpmkBobot;
use Carbon\Carbon;

class CpmkCplSheetImport implements ToCollection
{
    protected $incr = 0;
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

        $totalRow = count(json_decode($collection)) - 1;
        $dataArr = json_decode($collection);
        $insertDataMhs = [];
        $insertDataCpmk = [];
        $insertDataCpl = [];
        $insertDataCompetency = [];
        $insertACplCompetency = [];

        $stateCompetency = [];

        $getStateProdi = StateProdi::getProdi();
        $getStateMatkul = StateProdi::getMatkul();
        $getStateSemester = StateProdi::getSemester();
        $getStateSKS = StateProdi::getSKS();
        $getNIDN = StateProdi::getNIDN();
        $getJenjang = StateProdi::getJenjang();
        $getTahunAjaran = StateProdi::getTahunAjaran();
        $getStateMhs = StateMhs::getNim();
        $getUniqueCode = StateUniqueCode::getUniqueCode();
        
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();
        $myProdi = MProgramStudy::where('id',$getProdi->program_study_id)->first();

        $checkMMatkul = MMataKuliah::where('code', $getStateMatkul)->first();

        if ($checkMMatkul == null) {
            $this->messages = 'Mata Kuliah tidak ditemukan ! ';
            goto error;
        }

        $data = [];
        for ($i=19; $i <= 26; $i++) { 
            for ($j=2; $j < 41; $j++) { 
                $data[$i-18][$j-1] = $collection[$i][$j];
            }
        }
        StateProdi::setCplMap($data);

        $dataCpmk = [];
        for ($i=7; $i <= 14; $i++) {
            if ($collection[$i][3] != null) {
                array_push($dataCpmk, $collection[$i][3]);
            }
        }
        StateProdi::setCpmkMap($dataCpmk);

        // dd(StateProdi::getCpmkCplMap());

        $checkExistingMatkul = AMataKuliah::selectRaw('a_mata_kuliah.*')
                                        ->where('unique_code', $getUniqueCode)
                                        ->where('a_mata_kuliah.deleted_at', null)
                                        ->first();

        $countMhs = 0;
        $arrUsedIndex = [];
        $arrUnusedIndex = [];
        if ($checkExistingMatkul == null) {
            StateMhs::setTotalMhs(count($getStateMhs));
            foreach ($getStateMhs as $keyStateMhs => $valueStateMhs) {
                
                $checkMhsProdi = AMahasiswaProgramStudy::where('m_mahasiswa_nim', 'LIKE', '%'.$valueStateMhs.'%')->where('m_program_study_id', $myProdi->id)->first();
                
                if ($checkMhsProdi == null) {
                    array_push($arrUnusedIndex, $keyStateMhs);
                    unset($getStateMhs[$keyStateMhs]);
                }else{
                    $arrUsedIndex[$keyStateMhs] = str_replace(' ', '', $valueStateMhs);
                    $countMhs +=  1;
                }
            }

            $setState = new StateMhs($getStateMhs);
            
            StateMhs::setUsedIndex($arrUsedIndex);
            StateMhs::setUnusedIndex($arrUnusedIndex);

            // dd(StateMhs::getDeletedIndex());

            if (count($getStateMhs) == $countMhs) {
                // SAMA. OVERWRITE

                if ($checkExistingMatkul != null) {
                    AMataKuliah::where('unique_code', $checkExistingMatkul->unique_code)
                                ->update([
                                    'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);
                }
            }
        }
        $bobotCpmk = null;
        $thisBobot = [];

        for ($i=2; $i <= 10; $i++) {
            if ($collection[$i][16] != null) {
                $thisBobot[$collection[$i][16]] = [$collection[$i][18]];
                for ($j=19; $j <= 26; $j++) {
                    if ($collection[$i][$j] != null) {
                        array_push($thisBobot[$collection[$i][16]], $j-18);
                    }
                }
            }
        }
        $bobotCpmk = new StateCpmkBobot($thisBobot);

        $getBobotCpmk = StateCpmkBobot::getBobot();
        // dd($getBobotCpmk);

        $arrBobotDetail = [];
        foreach ($getBobotCpmk as $keyBobot => $valueBobot) {
            if (str_contains($keyBobot, 'Tugas')) {
                StateCpmkBobot::appendBobot('tugas', $valueBobot[0]);
                $arrBobotDetail[$keyBobot] = $valueBobot[0];
            }else if (str_contains($keyBobot, 'UAS')) {
                StateCpmkBobot::appendBobot('uas', $valueBobot[0]);
            }
        }
        // dd(StateCpmkBobot::getter('uas'));

        // echo $collection;
        if ($checkMMatkul == null) {
            goto skip;
        }

        $checkAMatkul = AMataKuliah::where('unique_code', $getUniqueCode)
                                    ->first();
        // dd($arrBobotDetail);
        if ($checkAMatkul == null) {
            AMataKuliah::insert([
                'master_id' => $myProdi['id'],
                'mata_kuliah_code' => $getStateMatkul,
                'type' => 'p',
                'm_class_code' => null,
                'semester' => $getStateSemester,
                'sks' => $getStateSKS,
                'm_curriculum_code' => substr($getStateMatkul, 1, 4),
                'unique_code' => $getUniqueCode,
                'dosen_nidn' => $getNIDN,
                'level' => $getJenjang,
                'year' => $getTahunAjaran,
                'scale_task' => StateCpmkBobot::getter('tugas'),
                'scale_task_detail' => json_encode($arrBobotDetail),
                'scale_exam' => StateCpmkBobot::getter('uas'),
                'total_task' => StateCpmkBobot::getter('total_tugas'),
                'total_exam' => 1,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);

            $checkAMatkul = AMataKuliah::where('unique_code', $getUniqueCode)
                                                ->orderBy('id', 'DESC')
                                                ->first();
        }

        foreach ($getStateMhs as $keyMhs => $valueMhs) {
            $checkMhs = AMataKuliahMahasiswa::selectRaw('a_mata_kuliah_mahasiswa.*')
                                            ->join('a_mahasiswa_program_studies', 'a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id', '=', 'a_mahasiswa_program_studies.id')                                      
                                            ->where('a_mahasiswa_program_studies.m_mahasiswa_nim', $valueMhs)
                                            ->where('a_mahasiswa_program_studies.m_program_study_id', $getProdi->program_study_id)
                                            ->first();

            $checkMMhs = MMahasiswa::where('nim', 'LIKE','%'.$valueMhs.'%')->first();

            if ($checkMhs == null) {
                if ($checkMMhs) {
                    $mhsProdi = AMahasiswaProgramStudy::where('m_mahasiswa_nim', 'LIKE', '%'.str_replace(' ', '', $valueMhs).'%')
                                                        ->where('m_program_study_id', $getProdi->program_study_id)
                                                        ->first();
                    // AMataKuliahMahasiswa::insert([
                    //     'a_mata_kuliah_id' => $getLastInsertedAMatkul->id,
                    //     'a_mahasiswa_program_study_id' => $mhsProdi->id,
                    //     'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                    // ]);
                    // dd($valueMhs);
                    $dataMhs = [
                        'a_mata_kuliah_id' => $checkAMatkul->id,
                        'a_mahasiswa_program_study_id' => $mhsProdi->id,
                        'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                    ];

                    array_push($insertDataMhs, $dataMhs);
                }
            }
        }

        $insertDataMhs = collect($insertDataMhs);

        $chunksMhs = $insertDataMhs->chunk(20);
        foreach ($chunksMhs as $chunkMhs)
        {
            AMataKuliahMahasiswa::insert($chunkMhs->toArray());
        }
        
        // Master CPMK
        for ($x=7; $x < 20; $x++) { 
            $cpmk = $dataArr[$x][3];
            $getMCpmk = null;

            $getMCpmk = MCpmk::where('name', 'LIKE', '%'.$cpmk.'%')->first();

            if ($cpmk == null) {
                goto skipCpmk;
            }

            if ($getMCpmk == null) {
                $dataCpmk = [
                    'name' => $cpmk,
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ];

                array_push($insertDataCpmk, $dataCpmk);
            }
        }
        skipCpmk:
        $insertDataCpmk = collect($insertDataCpmk);

        $chunksCpmk = $insertDataCpmk->chunk(20);
        foreach ($chunksCpmk as $chunkCpmk)
        {
            MCpmk::insert($chunkCpmk->toArray());
        }
        
        // Master CPL
        for ($y=30; $y < 70; $y++) { 
            $checkMCpl = MCpl::where('name', 'LIKE', $dataArr[$y][2])->first();

            if ($dataArr[$y][2] == null) {
                goto skipCpl;
            }
                            
            if ($checkMCpl == null) {
                $dataCpl = [
                    'code' => $dataArr[$y][1],
                    'name' => $dataArr[$y][2],
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ];

                array_push($insertDataCpl, $dataCpl);

            }

            $insertDataCompetency = [];
            $checkDuplicateColumn = 0;
            for ($z=15; $z <= 50; $z+=6) { 

                if ($dataArr[$y][$z] == null) {
                    goto skipCompetency2;
                }

                $checkMCompetency = MCompetency::where('name', 'LIKE', $dataArr[$y][$z])->first();

                foreach ($insertDataCompetency as $keyDataCompetency => $valueDataCompetency) {
                    if($dataArr[$y][$z] == $valueDataCompetency['name']){
                        goto skipCompetency3;
                    }
                }

                if ($checkMCompetency == null && $dataArr[$y][$z] != null) {
                    $dataCompetency = [
                        'name' => $dataArr[$y][$z],
                        'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                    ];

                    array_push($insertDataCompetency, $dataCompetency);
                }
                skipCompetency3:
            }
            skipCompetency2:
            
            // Chunk data competency
            $insertDataCompetency = collect($insertDataCompetency);

            $chunksCompetency = $insertDataCompetency->chunk(20);
            foreach ($chunksCompetency as $chunkCompetency)
            {
                MCompetency::insert($chunkCompetency->toArray());
            }
        }
        skipCpl:
        $insertDataCpl = collect($insertDataCpl);

        $chunksCpl = $insertDataCpl->chunk(20);
        foreach ($chunksCpl as $chunkCpl)
        {
            MCpl::insert($chunkCpl->toArray());
        }

        $insertACplCompetency = [];

        for ($i=7; $i < 20 ; $i++) { 
            $cpmk = $dataArr[$i][3];
            // echo $cpmk . ' asdf fdas \n';
            // goto skip;
            // echo $cpmk;
            if($cpmk == null){
                goto skip;
            }else{
                
                $getMCpmk = MCpmk::where('name', 'LIKE', '%'.$cpmk.'%')->first();

                $getMatkulCpmk = AMataKuliahCpmk::where('a_mata_kuliah_id', $checkAMatkul->id)
                                                ->where('cpmk_id', $getMCpmk->id)
                                                ->first();

                if ($getMatkulCpmk == null) {
                    AMataKuliahCpmk::insert([
                        'a_mata_kuliah_id' => $checkAMatkul->id,
                        'cpmk_id' => $getMCpmk->id,
                        'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                    ]);
                }

                $getMatkulCpmk = AMataKuliahCpmk::where('a_mata_kuliah_id', $checkAMatkul->id)
                                                ->where('cpmk_id', $getMCpmk->id)
                                                ->orderBy('id', 'DESC')
                                                ->first();

                for ($j=30; $j < 70; $j++) { 
                    try {
                        if ($dataArr[$j][1] != null) {
                            // echo $dataArr[$j][1] . ' ' . $dataArr[$j][2] . '   ====   ';

                            $checkMCpl = MCpl::where('name', $dataArr[$j][2])->orderBy('id', 'DESC')->first();
                            $getMataKuliahCpl = null;
                            if ($checkMCpl) {
                                $getMataKuliahCpl = AMataKuliahCpl::where('a_mata_kuliah_id', $checkAMatkul->id)
                                                                    ->where('cpl_id', $checkMCpl->id)
                                                                    ->orderBy('id', 'DESC')
                                                                    ->first();
                                if ($getMataKuliahCpl == null) {
                                    AMataKuliahCpl::insert([
                                        'a_mata_kuliah_id' => $checkAMatkul->id,
                                        'cpl_id' => $checkMCpl->id,
                                        'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                                    ]);
    
                                    
                                    $getMataKuliahCpl = AMataKuliahCpl::where('a_mata_kuliah_id', $checkAMatkul->id)
                                                                        ->where('cpl_id', $checkMCpl->id)
                                                                        ->orderBy('id', 'DESC')
                                                                        ->first();
                                }
                            }

                            // echo 'kesini 256';
                            $checkMCompetency = null;
                            $stateCompetency = [];
                            for ($z=15; $z <= count($dataArr[$j]); $z+=6) { 
                                $checkMCompetency = MCompetency::where('name', 'LIKE', $dataArr[$j][$z])->first();
    
                                $getMataKuliahCompetency = AMataKuliahCompetency::where('a_mata_kuliah_id', $checkAMatkul->id)
                                                                    ->where('competencies_id', $checkMCompetency->id)
                                                                    ->orderBy('id', 'DESC')
                                                                    ->first();
                                // echo 'kesini 265';
                                if ($getMataKuliahCompetency == null) {
                                    // echo 'kesini 267';
                                    AMataKuliahCompetency::insert([
                                        'a_mata_kuliah_id' => $checkAMatkul->id,
                                        'competencies_id' => $checkMCompetency->id,
                                        'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                                    ]);
                                    // echo 'kesini 273';
                                    $getMataKuliahCompetency = AMataKuliahCompetency::where('a_mata_kuliah_id', $checkAMatkul->id)
                                                                        ->where('competencies_id', $checkMCompetency->id)
                                                                        ->orderBy('id', 'DESC')
                                                                        ->first();
                                }
                                // echo 'kesini 279';
                                $checkACplCompetency = null;

                                if ($getMataKuliahCpl) {
                                    $checkACplCompetency = ACplCompetency::where('a_mata_kuliah_cpl_id', $getMataKuliahCpl->id)
                                                                            ->where('a_mata_kuliah_competencies_id', $getMataKuliahCompetency->id)
                                                                            ->first();
                                    if ($checkACplCompetency == null) {
                                        // echo 'kesini 286';
                                        $data = [
                                            'a_mata_kuliah_cpl_id' => $getMataKuliahCpl->id,
                                            'a_mata_kuliah_competencies_id' => $getMataKuliahCompetency->id,
                                            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                                        ];
                                        
                                        array_push($insertACplCompetency, $data);
                                    }
                                }

                            }
                        }
                    } catch (\Throwable $th) {
                        echo 'error Line 300  :  ' . $th;
                    }
                    
                }
            }
        }

        skip:
        // echo json_encode($insertACplCompetency);
        $insertACplCompetency = collect($insertACplCompetency);
        
        $chunksACplCompetency = $insertACplCompetency->chunk(20);
        foreach ($chunksACplCompetency as $chunkACplCompetency)
        {
            ACplCompetency::insert($chunkACplCompetency->toArray());
        }

        $checkAMatkul = AMataKuliah::where('unique_code', $getUniqueCode)
                                    ->first();
        // echo 'getVSCpmk ::::  '.$getUniqueCode;

        $insertACpmkCpl = [];

        $getVSCpmk = AMataKuliahCpmk::selectRaw('a_mata_kuliah_cpmk.*')
                                        ->join('m_cpmk', 'a_mata_kuliah_cpmk.cpmk_id', '=', 'm_cpmk.id')
                                        ->where('a_mata_kuliah_cpmk.a_mata_kuliah_id', $checkAMatkul['id'])
                                        ->orderBy('m_cpmk.id', 'ASC')
                                        ->get();

        $getVSCpmkArr = $getVSCpmk->toArray();
        // dump($getVSCpmkArr);
        for ($xxx=19; $xxx < 19 + count($getVSCpmkArr); $xxx++) { 
            // dump($xxx);
            // dump($xxx-19);
            // dd($dataArr[$xxx][1]);
            for ($yyy=2; $yyy < count($dataArr[20]); $yyy++) {
                $getVSCpl = AMataKuliahCpl::selectRaw('a_mata_kuliah_cpl.*')
                                            ->join('m_cpl', 'a_mata_kuliah_cpl.cpl_id', '=', 'm_cpl.id')
                                            ->where('a_mata_kuliah_cpl.a_mata_kuliah_id', $checkAMatkul['id'])
                                            ->where('m_cpl.code', 'CPL'.(($yyy-1 < 10) ? '0'.$yyy-1 : $yyy-1))
                                            ->first();

                // echo 'getVSCpl ::::  '.$getVSCpl;
                // dump($getVSCpl);

                // dump('getVSCPL : ' . $getVSCpl);
                if ($dataArr[$xxx][$yyy] == 'x' && $getVSCpl != null) {
                    // dump($dataArr)[$xxx];
                    $getCpmkCpl = ACpmkCpl::where('a_mata_kuliah_cpmk_id', $getVSCpmkArr[$xxx-19]['id'])
                                            ->where('a_mata_kuliah_cpl_id', $getVSCpl['id'])
                                            ->orderBy('id', 'DESC')
                                            ->first();
        
                    if ($getCpmkCpl == null) {
                        $data = [
                            'a_mata_kuliah_cpmk_id' => $getVSCpmkArr[$xxx-19]['id'],
                            'a_mata_kuliah_cpl_id' => $getVSCpl['id'],
                            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                        ];

                        array_push($insertACpmkCpl, $data);
                    }
                }

            }

        }
        
        
        $insertACpmkCpl = collect($insertACpmkCpl);

        $chunksACpmkCpl = $insertACpmkCpl->chunk(20);
        foreach ($chunksACpmkCpl as $chunkCpmkCpl)
        {
            ACpmkCpl::insert($chunkCpmkCpl->toArray());
        }
    }
}
