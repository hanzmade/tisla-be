<?php

namespace App\Imports\Prodi;

use App\Models\MMahasiswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets ;

class StateProdi
{
   protected static $prodi = null;
   protected static $mata_kuliah = null;
   protected static $semester = null;
   protected static $sks = null;
   protected static $nidn = null;
   protected static $jenjang = null;
   protected static $tahunAjaran = null;

   protected static $cplMap= [];
   protected static $cpmkMap= [];

   protected static $message= null;
   protected static $compareWeight = [];

   function __construct($prodi, $mata_kuliah, $semester, $sks, $nidn, $jenjang, $tahunAjaran)
   {
    self::$prodi = $prodi;
    self::$mata_kuliah = $mata_kuliah;
    self::$semester = $semester;
    self::$sks = $sks;
    self::$nidn = $nidn;
    self::$jenjang = $jenjang;
    self::$tahunAjaran = $tahunAjaran;
   }

   public static function getProdi()
   {
    return self::$prodi;
   }
   public static function getMatkul()
   {
    return self::$mata_kuliah;
   }
   public static function getSemester()
   {
    return self::$semester;
   }
   public static function getSKS()
   {
    return self::$sks;
   }
   public static function getNIDN()
   {
    return self::$nidn;
   }
   public static function getJenjang()
   {
    return self::$jenjang;
   }
   public static function getTahunAjaran()
   {
    return self::$tahunAjaran;
   }

   public static function setCplMap($data)
   {
      self::$cplMap = $data;
   }
   public static function getCplMap()
   {
    return self::$cplMap;
   }

   public static function setCpmkMap($data)
   {
      self::$cpmkMap = $data;
   }
   public static function getCpmkMap()
   {
    return self::$cpmkMap;
   }

   public static function setError($message)
   {
      self::$message = $message;
   }
   public static function getError()
   {
    return self::$message;
   }
   
   public static function setCompareWeight($weight)
   {
      self::$compareWeight = $weight;
   }

   public static function getCompareWeight()
   {
    return self::$compareWeight;
   }
}
