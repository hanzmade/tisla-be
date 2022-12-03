<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\UserRole;

class EnsureUserHasRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, $role)
    {
        if ($role == 'admin') {
            $role = 4;
        }else if($role == 'prodi'){
            $role = 5;
        }

        $getRole = UserRole::where('user_id', $request->user()->id)->first();
        if ($getRole['role_id'] != $role) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized'
            ]);
        }
 
        return $next($request);
    }
}
