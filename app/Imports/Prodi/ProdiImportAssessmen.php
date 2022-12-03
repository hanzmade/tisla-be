<?php

namespace App\Imports\Prodi;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class ProdiImportAssessmen implements WithMultipleSheets
{
    protected $prodi = null;
    public function sheets(): array
    {
        return [
            0 => new GetProdiSheetImport(),
            1 => new CpmkCplSheetImport(),
            2 => new CpmkBobotImport(),
            3 => new CplBobotImport(),
            6 => new MhsScoreImport(),
            15 => new GetProdiMatkulEvaluationImport(),
        ];
    }
}
