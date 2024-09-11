<?php

use Illuminate\Support\Facades\Route;


Route::get('/', function () {return view('auth.login');});
Route::get('login', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'loginPage'])->name('login');
Route::post('loginPost', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'loginPost'])->name('loginPost');

Route::group(['middleware' => 'auth'], function () {
    Route::get('GetMenu', [\App\Http\Controllers\SidebarController::class, 'index']);

    Route::post('/logout', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'logout'])->name('logout');

    Route::get('dashboard', [\App\Http\Controllers\DashboardController::class, 'index'])->name('dashboard');
    Route::resource('dashboard', \App\Http\Controllers\DashboardController::class);

    Route::resource('UserInfo', \App\Http\Controllers\UserConfig\UserInfoController::class);
    Route::post('/users/data', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'getUserData'])->name('users.data');

    Route::resource('ProType', \App\Http\Controllers\ProSetup\ProTypeController::class);
    Route::post('/ProType/data', [\App\Http\Controllers\ProSetup\ProTypeController::class, 'getData'])->name('ProType.data');

    Route::resource('ProCategory', \App\Http\Controllers\ProSetup\ProCategoryController::class);
    Route::post('/ProCategory/data', [\App\Http\Controllers\ProSetup\ProCategoryController::class, 'getData'])->name('ProCategory.data');

    Route::resource('ProSubCategory', \App\Http\Controllers\ProSetup\ProSubCategoryController::class);
    Route::get('GetProCategory', [\App\Http\Controllers\ProSetup\ProSubCategoryController::class, 'GetProCategory']);
    Route::post('/ProSubCategory/data', [\App\Http\Controllers\ProSetup\ProSubCategoryController::class, 'getData'])->name('ProSubCategory.data');

    Route::resource('ProInfo', \App\Http\Controllers\ProSetup\ProInfoController::class);
    Route::get('GetProSubCatByCatId', [\App\Http\Controllers\ProSetup\ProInfoController::class, 'GetProSubCatByCatId']);
    Route::get('GetProType', [\App\Http\Controllers\ProSetup\ProInfoController::class, 'GetProType']);
    Route::post('/ProInfo/data', [\App\Http\Controllers\ProSetup\ProInfoController::class, 'getData'])->name('ProInfo.data');
});
