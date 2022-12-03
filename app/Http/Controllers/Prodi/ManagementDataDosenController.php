<?php

namespace App\Http\Controllers\Prodi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ADosenProgramStudy;
use App\Models\MDosen;
use App\Models\MDosenEducation;
use App\Models\UserRole;
use App\Models\AUserProgramStudy;
use Carbon\Carbon;

class ManagementDataDosenController extends Controller
{
    public function index(Request $request)
    {
        $getDosen = null;
        if ($request->search) {
            $getDosen = AUserProgramStudy::selectRaw('m_dosen.*')
                                            ->join('a_dosen_program_studies', 'a_user_program_studies.program_study_id', '=', 'a_dosen_program_studies.m_program_study_id')
                                            ->join('m_dosen', 'a_dosen_program_studies.m_dosen_nidn', '=', 'm_dosen.nidn')
                                            ->where('a_user_program_studies.user_id', auth()->user()->id)
                                            ->where('m_dosen.deleted_at', null)
                                            ->where('m_dosen.name', 'LIKE', '%'.$request->search.'%')
                                            ->get();
        }else{
            $getDosen = AUserProgramStudy::selectRaw('m_dosen.*')
                                            ->join('a_dosen_program_studies', 'a_user_program_studies.program_study_id', '=', 'a_dosen_program_studies.m_program_study_id')
                                            ->join('m_dosen', 'a_dosen_program_studies.m_dosen_nidn', '=', 'm_dosen.nidn')
                                            ->where('a_user_program_studies.user_id', auth()->user()->id)
                                            ->where('m_dosen.deleted_at', null)
                                            ->groupBy('m_dosen.id')
                                            ->get();
                                            
        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data dosen',
            'data' => $getDosen
        ]);
    }

    public function insert(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();
              
        $imageName = null;
        try {
            $imageName = time().'.'.$request->image_url->extension(); 
            $request->image_url->move(public_path('storage/files/prodi/dosen_photo'), $imageName);
        } catch (\Throwable $th) {
            $imageName = null;
        }
        $insert = MDosen::insert([
            'name' => $request->name,
            'nidn' => $request->nidn,
            'jfa' => $request->jfa,
            'science' => $request->science,
            'taught_courses' => $request->taught_courses,
            'image_url' => url('storage/files/prodi/dosen_photo') . '/' . $imageName,
            'gs_url' => $request->gs_url,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);

        if ($insert) {
            foreach ($request->educations as $keyEducation => $valueEducation) {
                MDosenEducation::insert([
                    'm_dosen_nidn' => $request->nidn,
                    'education' => $valueEducation,
                    'created_at' => Carbon::now()->format('Y-m-d')
                ]);
            }
        }

        ADosenProgramStudy::insert([
            'm_dosen_nidn' => $request->nidn,
            'm_program_study_id' => $getProdi->program_study_id,
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil menambahkan dosen'
        ]);
    }

    public function edit(Request $request)
    {
        $getDosen = MDosen::where('nidn', $request->nidn)->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data dosen',
            'data' => $getDosen
        ]);
    }

    public function update(Request $request)
    {
        $getProdi = AUserProgramStudy::where('user_id', auth()->user()->id)->first();
        $imageName = null;
        try {
            $imageName = time().'.'.$request->image_url->extension(); 
            $request->image_url->move(public_path('storage/files/prodi/dosen_photo'), $imageName);
        } catch (\Throwable $th) {
            $imageName = null;
        }

        if ($imageName != null) {
            $dataMDosen = [
                'name' => $request->name,
                'jfa' => $request->jfa,
                'science' => $request->science,
                'taught_courses' => $request->taught_courses,
                'gs_url' => $request->gs_url,
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'image_url' => url('storage/files/prodi/dosen_photo') . '/' . $imageName
            ];
        }else{
            $dataMDosen = [
                'name' => $request->name,
                'jfa' => $request->jfa,
                'science' => $request->science,
                'taught_courses' => $request->taught_courses,
                'gs_url' => $request->gs_url,
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ];

        }

        $update = MDosen::where('nidn',$request->nidn)->update($dataMDosen);

        // if ($update) {
        //     foreach ($request->educations as $keyEducation => $valueEducation) {
        //         MDosenEducation::where('id',$valueEducation->id)->update([
        //             'education' => $valueEducation,
        //             'updated_at' => Carbon::now()->format('Y-m-d')
        //         ]);
        //     }
        // }

        if ($update) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil mengubah data dosen'
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Gagal mengubah data dosen',
                'dataMDosen' => $request
            ]);
        }
    }

    public function destroy(Request $request)
    {
        $delete = MDosen::where('nidn', $request->nidn)
                        ->update([
                            'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                        ]);

        $delete2 = MDosenEducation::where('m_dosen_nidn', $request->nidn)
                                    ->update([
                                        'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                    ]);

        $delete3 = ADosenProgramStudy::where('m_dosen_nidn', $request->nidn)
                                        ->update([
                                            'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                                        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil menghapus data dosen'
        ]);
    }
}
