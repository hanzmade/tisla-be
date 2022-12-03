<?php

namespace App\Imports;

use App\Models\MMahasiswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class State 
{
   protected static $prodi = null;

   function __construct($prodi)
   {
    self::$prodi = $prodi;
   }

   public static function get()
   {
    return self::$prodi;
   }
}
