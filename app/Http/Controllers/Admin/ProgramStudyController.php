<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MProgramStudy;
use App\Models\UserRole;
use Carbon\Carbon;

class ProgramStudyController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index()
    {
        $programStudy = MProgramStudy::selectRaw('id, name, code, pddikti_code')
                                    ->where('deleted_at', null)
                                    ->get();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan list program study',
            'data' => $programStudy
        ]);
    }

    public function insert(Request $request)
    {

        $checkExisting = MProgramStudy::where('name', $request->name)
                                        ->where('deleted_at', null)
                                        ->first();

        if ($checkExisting == null) {   
            $insert = MProgramStudy::insert([
                'name' => $request->name,
                'code' => $request->code,
                'pddikti_code' => $request->pddikti_code,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
    
            if ($insert) {
                return response()->json([
                    'success' => true,
                    'message' => 'Berhasil menambahkan program study',
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Gagal menambahkan program study',
                ]);
            }
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menambahkan program study. Program study sudah ada !',
            ]);
        }
             
        
    }

    public function edit(Request $request)
    {
        $getProdi = MProgramStudy::selectRaw('id, name, code, pddikti_code')
                                ->where('id', $request->id)
                                ->where('deleted_at', null)
                                ->first();

                                
        if ($getProdi) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil mendapatkan program study',
                'data' => $getProdi
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal mendapatkan program study',
            ]);
        }
    }

    public function update(Request $request)
    {
        $update = MProgramStudy::where('id', $request->id)
                                    ->update([
                                        'name' => $request->name,
                                        'code' => $request->code,
                                        'pddikti_code' => $request->pddikti_code,
                                        'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                                    ]);

        if ($update) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil mengubah program study'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal mengubah program study',
            ]);
        }
    }

    public function destroy(Request $request)
    {
        $destroy = MProgramStudy::where('id', $request->id)
                                ->update([
                                    'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                ]);


        if ($destroy) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil menghapus program study'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menghapus program study',
            ]);
        }
    }
}
