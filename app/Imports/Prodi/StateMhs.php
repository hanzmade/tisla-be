<?php

namespace App\Imports\Prodi;

use App\Models\MMahasiswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class StateMhs
{
   protected static $nim = null;

   protected static $usedIndex = null;
   protected static $unusedIndex = null;
   protected static $totalMhs = 0;

   function __construct($nim)
   {
    self::$nim = $nim;
   }

   public static function getNim()
   {
    return self::$nim;
   }

   public static function setUsedIndex($arrIndex)
   {
      self::$usedIndex = $arrIndex;
   }

   public static function getUsedIndex()
   {
    return self::$usedIndex;
   }

   public static function setUnusedIndex($arrIndex)
   {
      self::$unusedIndex = $arrIndex;
   }

   public static function getUnusedIndex()
   {
    return self::$unusedIndex;
   }

   public static function setTotalMhs($total)
   {
      self::$totalMhs = $total;
   }

   public static function getTotalMhs()
   {
    return self::$totalMhs;
   }
}
