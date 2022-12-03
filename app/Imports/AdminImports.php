<?php

namespace App\Imports;

use App\Models\MMahasiswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class AdminImports implements WithMultipleSheets 
{
    protected $prodi = null;
    public function sheets(): array
    {
        return [
            1 => new MahasiswaSheetImport(),
            0 => new DosenSheetImport(),
        ];
    }
}
