<?php

namespace App\Http\Controllers\Prodi;

use Illuminate\Http\Request;
use App\Models\UserRole;
use App\Models\SyncronizeFile;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\Prodi\ProdiImportAssessmen;
use App\Imports\Prodi\StateUniqueCode;
use App\Models\LogApi;
use Illuminate\Support\Facades\Hash;
use App\Imports\Prodi\StateProdi;

class AssessmentController extends Controller
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
        $uniqueCode = Hash::make(Carbon::now()->format('Y-m-d H:i:s'));
        $fileName = time().'.'.$request->file->extension();  
        $request->file->move(public_path('storage/files/prodi/assessment'), $fileName);
        $insert = SyncronizeFile::insert([
            'user_id' => auth()->user()->id,
            'path' => public_path('storage/files/prodi/assessment/') . $fileName,
            'filename' => $fileName,
            'unique_code' => $uniqueCode,
            'type' => 'assessmen',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);
   
        LogApi::insert([
            'user_id' => auth()->user()->id,
            'code' => 200,
            'url' => '/api/upload-file-assessmen',
            'message' => 'Berhasil upload file ' . $fileName,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);
        return response()->json([
            'success' => true,
            'message' => 'Berhasil upload file !',
            'path' => public_path('storage/files/prodi/assessment/') . $fileName,
            'filename' => $fileName,
            'uniqueCode' => $uniqueCode
        ]);
    }

    public function render(Request $request)
    {
        $stateUniqueCode = new StateUniqueCode($request->uniqueCode);

        try {
            Excel::import(new ProdiImportAssessmen, public_path('storage/files/prodi/assessment/') . $request->filename);
            // $getError = StateProdi::getError();

            // if ($getError != null) {
            //     throw new Exception($getError);
            // }
            
            LogApi::insert([
                'user_id' => auth()->user()->id,
                'code' => 200,
                'url' => '/api/render-file-assessmen',
                'message' => 'Berhasil render',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
            return response()->json([
                'success' => true,
                'message' => 'Berhasil render.'
            ]);
        } catch (Exception $th) {
            LogApi::insert([
                'user_id' => auth()->user()->id,
                'code' => 500,
                'url' => '/api/render-file-assessmen',
                'message' => 'Gagal render ! Silakan coba lagi. ' . $th,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
            return response()->json([
                'success' => false,
                'message' => 'Gagal render ! Silakan coba lagi. ' . $th
            ]);
        }

    }

    public function versionControlFile()
    {
        if (Carbon::parse(auth()->user()->expired_at)->format('Y-m-d') < Carbon::now()->format('Y-m-d') ) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal mendapatkan data. Akun anda expired ! Silakan hubungi admin TISLA.'
            ]);
        }

        $getList = SyncronizeFile::selectRaw('id, user_id, path, filename, unique_code, created_at')
                                ->where('user_id', auth()->user()->id)
                                ->where('type', 'assessmen')
                                ->orderBy('id','DESC')
                                ->get();


        
        if (count($getList) > 0) {
            
            LogApi::insert([
                'user_id' => auth()->user()->id,
                'code' => 200,
                'url' => '/api/version-control-file-assessmen',
                'message' => 'Berhasil mendapatkan data asesmen',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
            return response()->json([
                'success' => true,
                'message' => 'Berhasil mendapatkan data.',
                'data' => $getList
            ]);
        }else{
                        
            LogApi::insert([
                'user_id' => auth()->user()->id,
                'code' => 200,
                'url' => '/api/version-control-file-assessmen',
                'message' => 'Data tidak ditemukan',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
            return response()->json([
                'success' => true,
                'message' => 'Data tidak ditemukan.',
                'data' => $getList
            ]);
        }
    }
}
