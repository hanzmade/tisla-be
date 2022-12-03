<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MCurriculum;
use App\Models\MProgramStudy;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;

class ManagementKurikulumController extends Controller
{
    public function index()
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();

        $prodiCode = MProgramStudy::where('id', $getProdi['program_study_id'])
                                        ->first();
        // dd($getProdi['program_study_id']);
        $getCurriculum = MCurriculum::where('code', 'LIKE', $prodiCode['code'].'%')
                                    ->where('deleted_at', null)
                                    ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data kurikulum',
            'prodiCode' => $prodiCode['code'],
            'data' => $getCurriculum
        ]);

    }

    public function insert(Request $request)
    {
        $insert = MCurriculum::insert([
            'name' => $request->name,
            'code' => $request->code,
            'created_at' => $request->created_at
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil memasukkan data kurikulum'
        ]);
    }

    public function edit(Request $request)
    {
        $getCurriculum = MCurriculum::where('id', $request->id)
                                    ->where('deleted_at', null)
                                    ->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data kurikulum',
            'data' => $getCurriculum
        ]);
    }

    public function update(Request $request)
    {
        $update = MCurriculum::where('id', $request->id)
                                ->update([
                                    'name' => $request->name,
                                    'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mengubah data kurikulum'
        ]);
    }

    public function destroy(Request $request)
    {
        $update = MCurriculum::where('id', $request->id)
                                ->update([
                                    'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil menghapus data kurikulum'
        ]);
    }
}
