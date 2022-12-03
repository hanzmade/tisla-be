<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 
use Mail;
use App\Mail\ResetPassword;
use Carbon\Carbon;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class ForgetPasswordController extends Controller
{
    public function forgetPassword(Request $request)
    {
        if ($request->email == null) {
            return response()->json([
                'success' => false,
                'message' => 'Email tidak boleh kosong !'
            ], 500);
        }

        Mail::to($request->email)->send(new ResetPassword(base64_encode($request->email.'|'.Carbon::now()->format('Y-m-d H:i:s'))));

        return response()->json([
            'success' => true,
            'message' => 'Berhasil mengirimkan email reset password. Silakan check email Anda !'
        ]);
 
        // if (Mail::failures()) {
        //      return response()->Fail('Maaf !  Pengiriman email reset password gagal. Silakan coba lagi.');
        // }else{
        // }
    }

    public function resetPassword(Request $request)
    {
        if ($request->password == null || $request->password_confirmation == null) {
            return response()->json([
                'success' => false,
                'message' => 'Password dan Password Confirmation harus sama !'
            ], 500);
        }

        $getEmail = explode('|', base64_decode($request->permalink));
        $update = User::where('email', $getEmail[0])
                        ->update([
                            'password' => Hash::make($request->password)
                        ]);
        // dd(base64_decode($request->permalink));
        if ($update) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil reset password !'
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Gagal reset password !'
            ], 500);
        }
    }
}
