<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SyncronizeFile;
use App\Models\UserRole;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\AdminImports;
use Carbon\Carbon;

class SyncronizeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function uploadFile(Request $request)
    {
        // $validatedData = $request->validate([
        //     'file' => 'required|csv,xlx,xls,xlsm|max:2048',
        // ]);

        $fileName = time().'.'.$request->file->extension();  
        $request->file->move(public_path('storage/files/admin'), $fileName);

        $insert = SyncronizeFile::insert([
            'user_id' => auth()->user()->id,
            'path' => public_path('storage/files/admin/') . $fileName,
            'filename' => $fileName,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);
   
        return response()->json([
            'success' => true,
            'message' => 'Berhasil upload file !',
            'path' => public_path('storage/files/admin/') . $fileName,
            'filename' => $fileName
        ]);
    }

    public function render(Request $request)
    {
        // Excel::import(new AdminImports, request()->file('file'));

        try {
            Excel::import(new AdminImports, public_path('storage/files/admin/') . $request->filename);
            
            return response()->json([
                'success' => true,
                'message' => 'Berhasil render.'
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal render ! Silakan coba lagi. ' . $th
            ]);
        }

    }

    public function versionControlFile()
    {
        $getList = SyncronizeFile::selectRaw('id, user_id, path, filename, created_at')
                                ->where('user_id', auth()->user()->id)
                                ->orderBy('id','DESC')
                                ->get();


        
        if (count($getList) > 0) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil mendapatkan data.',
                'data' => $getList
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan.'
            ]);
        }
    }
}
