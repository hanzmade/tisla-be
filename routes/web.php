<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\SendEmailController;

Route::get('/', [SendEmailController::class, 'home']);
Route::get('send-email', [SendEmailController::class, 'index']);