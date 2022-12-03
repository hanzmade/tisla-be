<?php

namespace App\Imports\Prodi;

use App\Models\MMahasiswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class StateUniqueCode
{
   protected static $uniqueCode = null;

   function __construct($uniqueCode)
   {
    self::$uniqueCode = $uniqueCode;
   }

   public static function getUniqueCode()
   {
    return self::$uniqueCode;
   }
   
}
