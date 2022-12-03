<?php

namespace App\Imports\Prodi;

use App\Models\MMahasiswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class StateCpmkBobot
{
   protected static $bobot = [];
   protected static $tugas = 0;
   protected static $uas = 0;
   protected static $totalTugas = 0;

   function __construct($bobot)
   {
    self::$bobot = $bobot;
   }

   public static function getBobot()
   {
    return self::$bobot;
   }

   public static function appendBobot($key, $value)
   {
      if ($key == 'tugas') {
         self::$tugas += $value;
         self::$totalTugas += 1;
      }else if ($key == 'uas') {
         self::$uas += $value;
      }
   }

   public static function getter($key)
   {
      if ($key == 'tugas') {
         return self::$tugas;
      }else if ($key == 'uas') {
         return self::$uas;
      }else if ($key == 'total_tugas') {
         return self::$totalTugas;
      }
   }
}
