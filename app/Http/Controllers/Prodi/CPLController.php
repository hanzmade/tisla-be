<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MCpl;
use App\Models\AMataKuliahCpl;
use App\Models\AMataKuliah;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;

class CPLController extends Controller
{
    public function index()
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCpl = MCpl::selectRaw('m_cpl.code as cplCode, m_cpl.name as cplName, m_mata_kuliah.id as matkulId, 
                                    m_mata_kuliah.name as matkulName, a_mata_kuliah_cpl.id as amatkulcplid')
                            ->join('a_mata_kuliah_cpl', 'm_cpl.id', '=', 'a_mata_kuliah_cpl.cpl_id')
                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                            ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                            ->where('m_cpl.deleted_at', null)
                            ->where('a_mata_kuliah_cpl.deleted_at', null)
                            ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data cpl',
            'data' => $getCpl
        ]);

    }

    public function preInsert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getMatkul = AMataKuliah::selectRaw('a_mata_kuliah.id as matkulId, m_mata_kuliah.name')
                                ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                                ->where('master_id', $getProdi['program_study_id'])
                                ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data', 
            'data' => $getMatkul
        ]);
    }

    public function insert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $checkCpl = MCpl::where('code', $request->code)
                        ->where('name', 'LIKE', $request->name)
                        ->first();

        if ($checkCpl == null) {
            MCpl::insert([
                'code' => $request->code,
                'name' => $request->name,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
            
            $checkCpl = MCpl::where('code', $request->code)
                            ->where('name', 'LIKE', $request->name)
                            ->first();

        }

        $checkAMataKuliahCpl = AMataKuliahCpl::selectRaw('a_mata_kuliah_cpl.*')
                                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                                            ->where('a_mata_kuliah_cpl.cpl_id', $checkCpl['id'])
                                            ->first();

        if ($checkAMataKuliahCpl == null) {
            $getMatkul = 
            $insert = AMataKuliahCpl::insert([
                'a_mata_kuliah_id' => $request->matkulId,
                'cpl_id' => $checkCpl['id'],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Berhasil memasukkan data cpl'
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Tidak dapat menambahkan data !  Data sudah ada di system.'
            ]);
        }

    }

    public function edit(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $getCpl = MCpl::selectRaw('m_cpl.id as cplid, m_cpl.code, m_cpl.name as cplName, m_mata_kuliah.id as matkulId, 
                                    m_mata_kuliah.name as matkulName, a_mata_kuliah_cpl.id as amatkulcplid, 
                                    a_mata_kuliah_cpl.deleted_at')
                            ->join('a_mata_kuliah_cpl', 'm_cpl.id', '=', 'a_mata_kuliah_cpl.cpl_id')
                            ->join('a_mata_kuliah', 'a_mata_kuliah_cpl.a_mata_kuliah_id', '=', 'a_mata_kuliah.id')
                            ->leftJoin('m_mata_kuliah', 'a_mata_kuliah.mata_kuliah_code', '=', 'm_mata_kuliah.code')
                            ->where('a_mata_kuliah.master_id', $getProdi['program_study_id'])
                            ->where('m_cpl.code', $request->cplCode)
                            ->where('m_mata_kuliah.id', $request->matkulId)
                            ->where('m_cpl.deleted_at', null)
                            ->where('a_mata_kuliah_cpl.deleted_at', null)
                            ->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data cpl',
            'data' => $getCpl
        ]);
    }

    public function update(Request $request)
    {

        $update = MCpl::where('id', $request->cplId)
                                ->update([
                                    'name' => $request->cplName,
                                    'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);

        $checkMCpl = MCpl::where('id', $request->cplId)->first();

        $update2 = AMataKuliahCpl::where('id', $request->aMatkulCplId)
                                ->update([
                                    'cpl_id' => $checkMCpl['id']
                                ]);
        // dd($update);
        return response()->json([
            'success' => true,
            'message' => 'Berhasil mengubah data cpl'
        ]);
    }

    public function destroy(Request $request)
    {
        $update = AMataKuliahCpl::where('id', $request->aMatkulCplId)
                                ->update([
                                    'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil menghapus data cpl'
        ]);
    }
}
