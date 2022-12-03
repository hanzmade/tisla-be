<?php

namespace App\Imports\Prodi;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class ProdiImportMatkul implements WithMultipleSheets
{
    protected $prodi = null;
    public function sheets(): array
    {
        return [
            0 => new MatkulImport(),
            1 => new MatkulImport()
        ];
    }
}
