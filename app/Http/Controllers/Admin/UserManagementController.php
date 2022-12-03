<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Models\UserRole;
use App\Models\Role;
use App\Models\User;
use App\Models\AUserProgramStudy;
use App\Models\MProgramStudy;
use Illuminate\Support\Facades\Hash;
use App\Mail\AdminActivity;
use Carbon\Carbon;
use Mail;
use DB;

class UserManagementController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index()
    {
        $getListUser = UserRole::selectRaw("users.id, users.name, roles.name as prodiName, roles.id as prodiId, 
                                            users.email, users.created_at, users.updated_at, users.deleted_at, users.expired_at")
                            ->join('users', 'user_roles.user_id' ,'=', 'users.id')
                            ->join('roles', 'user_roles.role_id', '=', 'roles.id')
                            ->whereNot('user_roles.role_id', 4)
                            ->where('users.deleted_at', null)
                            ->paginate(10);

        return response()->json([
            'success' => true,
            'data' => $getListUser
        ]);
    }

    public function create()
    {
        $getRoles = Role::selectRaw('id, name')->get();
        $getProgramStudy = MProgramStudy::selectRaw('id, name')->where('deleted_at', null)->get();

        return response()->json([
            'success' => true,
            'roles' => $getRoles,
            'programStudy' => $getProgramStudy
        ]);
    }

    public function insert(Request $request)
    {
        try {
            DB::beginTransaction();

            $getUser = User::where('email', $request->email)
                            ->where('deleted_at', null)
                            ->orderBy('id','DESC')->first();

            if ($getUser ==  null) {
                
                $getLastUser = User::orderBy('id','DESC')->first();
                $user = User::insert([
                    'name' => $request->name,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'expired_at' => Carbon::now()->addMonths(6)->format('Y-m-d H:i:s'),
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ]);

        
                AUserProgramStudy::insert([
                    'user_id' => (int)$getLastUser['id'] + 1,
                    'program_study_id' => $request->programStudyId,
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ]);

                $getLastUser = User::orderBy('id','DESC')->first();
                UserRole::insert([
                    'user_id' => (int)$getLastUser['id'] + 1,
                    'role_id' => $request->roleId
                ]);
                
                DB::commit();
                $getProdi = MProgramStudy::where('id', $request->programStudyId)->first();
                $title = 'Penambahan User';
                $body = auth()->user()->name.' telah melakukan penambahan user '.$request->name.' untuk Prodi '.$getProdi['name'].' pada ' . Carbon::now()->format('d M Y H:i');

                Mail::to(auth()->user()->email)->send(new AdminActivity($title, $body));

                return response()->json([
                    'success' => true,
                    'message' => 'Berhasil menambahkan user'
                ]);

                
            }else{
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'Gagal menambahkan user. Email tidak boleh sama !'
                ]);
            }
        } catch (\Throwable $th) {

            DB::rollback();

            return response()->json([
                'success' => false,
                'message' => 'Gagal menambahkan user ' . $th
            ]);
        }
    }

    public function edit(Request $request)
    {
        $getSelectedUser = User::selectRaw('id, name, email, avatar, expired_at')->where('id', $request->id)->first();

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mendapatkan data user',
            'data' => $getSelectedUser
        ]);
    }

    public function update(Request $request)
    {
        $updateUser = User::where('id', $request->id)
                            ->update([
                                'name' => $request->name,
                                'email' => $request->email,
                                'expired_at' => $request->expired_at
                            ]);

        if ($updateUser) {
            $id = AUserProgramStudy::where('user_id', $request->id)->first();
            // dd($request->id);
            $getProdi = MProgramStudy::where('id', $id['program_study_id'])->first();
            $title = 'Update User';
            $body = auth()->user()->name.' telah melakukan update user '.$request->name.' untuk Prodi '.$getProdi['name'].' pada ' . Carbon::now()->format('d M Y H:i');

            Mail::to(auth()->user()->email)->send(new AdminActivity($title, $body));

            return response()->json([
                'success' => true,
                'message' => 'Berhasil mengubah data user'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal mengubah data user'
            ]);
        }
    }

    public function destroy(Request $request)
    {
        $deleteUser = User::where('id', $request->id)
                            ->update([
                                'deleted_at' => Carbon::now()->format('Y-m-d H:i:s')
                            ]);

        if ($deleteUser) {
            $id = AUserProgramStudy::where('user_id', $request->id)->first();
            
            $getProdi = MProgramStudy::where('id', $id['program_study_id'])->first();
            $title = 'Delete User';
            $body = auth()->user()->name.' telah melakukan delete user '.$request->name.' untuk Prodi '.$getProdi['name'].' pada ' . Carbon::now()->format('d M Y H:i');

            Mail::to(auth()->user()->email)->send(new AdminActivity($title, $body));

            return response()->json([
                'success' => true,
                'message' => 'Berhasil menghapus data user'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menghapus data user'
            ]);
        }
        
    }
}
