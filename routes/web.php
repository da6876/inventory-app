<?php

use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('auth.login');
});
Route::get('login', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'loginPage'])->name('login');
Route::post('loginPost', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'loginPost'])->name('loginPost');

Route::group(['middleware' => 'auth'], function () {
        Route::resource('menu-info', \App\Http\Controllers\UserConfig\SidebarController::class);
        Route::post('/menu-info/data', [\App\Http\Controllers\UserConfig\SidebarController::class, 'getData'])->name('menu-info.data');
        Route::get('/menus-by-role', [\App\Http\Controllers\UserConfig\SidebarController::class, 'getMenusByRole'])->middleware('auth');
        Route::get('getPrentMenu', [\App\Http\Controllers\UserConfig\SidebarController::class, 'getPrentMenu']);

        Route::resource('menu-permission', \App\Http\Controllers\UserConfig\MenuPermissionController::class);
        Route::get('getUserList', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'getUserList']);
        Route::get('getMenuList/{roleId}', [\App\Http\Controllers\UserConfig\SidebarController::class, 'getMenuList']);
        Route::post('/menu-permission/data', [\App\Http\Controllers\UserConfig\MenuPermissionController::class, 'getData'])->name('menu-permission.data');

        Route::post('/logout', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'logout'])->name('logout');

        Route::get('dashboard', [\App\Http\Controllers\DashboardController::class, 'index'])->name('dashboard');
        Route::resource('dashboard', \App\Http\Controllers\DashboardController::class);

        Route::resource('UserInfo', \App\Http\Controllers\UserConfig\UserInfoController::class);
        Route::post('/users/data', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'getUserData'])->name('users.data');

        Route::resource('user-type', \App\Http\Controllers\UserConfig\UserTypeController::class);
        Route::get('getUserTypeList', [\App\Http\Controllers\UserConfig\UserTypeController::class, 'getUserTypeList']);
        Route::post('/user-type/data', [\App\Http\Controllers\UserConfig\UserTypeController::class, 'getData'])->name('user-type.data');

        Route::resource('roles', \App\Http\Controllers\UserConfig\RoleController::class);
        Route::get('/permission', [\App\Http\Controllers\UserConfig\RoleController::class, 'indexs']);
        Route::get('getRolesList', [\App\Http\Controllers\UserConfig\RoleController::class, 'getRolesList']);
        Route::get('getRolesMenuList/{roleId}', [\App\Http\Controllers\UserConfig\RoleController::class, 'getMenuList']);
        Route::post('submitPermissions', [\App\Http\Controllers\UserConfig\RoleController::class, 'submitPermissions']);
        Route::post('/roles/data', [\App\Http\Controllers\UserConfig\RoleController::class, 'getData'])->name('roles.data');

        Route::resource('distributor-info', \App\Http\Controllers\UserConfig\DistributorInfoController::class);
        Route::get('getDisUserList', [\App\Http\Controllers\UserConfig\UserInfoController::class, 'getDisUserList']);
        Route::post('/distributor-info/data', [\App\Http\Controllers\UserConfig\DistributorInfoController::class, 'getData'])->name('distributor-info.data');

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

        Route::resource('DivisionInfo', \App\Http\Controllers\LocConfig\DivisionInfoController::class);
        Route::post('/DivisionInfo/data', [\App\Http\Controllers\LocConfig\DivisionInfoController::class, 'getData'])->name('DivisionInfo.data');

        Route::resource('DistrictInfo', \App\Http\Controllers\LocConfig\DistrictInfoController::class);
        Route::get('GetDivisionInfo', [\App\Http\Controllers\LocConfig\DistrictInfoController::class, 'GetDivisionInfo']);
        Route::post('/DistrictInfo/data', [\App\Http\Controllers\LocConfig\DistrictInfoController::class, 'getData'])->name('DistrictInfo.data');

        Route::resource('ThanaInfo', \App\Http\Controllers\LocConfig\ThanaInfoController::class);
        Route::get('GetDistrict', [\App\Http\Controllers\LocConfig\ThanaInfoController::class, 'GetDistrict']);
        Route::post('/ThanaInfo/data', [\App\Http\Controllers\LocConfig\ThanaInfoController::class, 'getData'])->name('ThanaInfo.data');

        Route::resource('AreaInfo', \App\Http\Controllers\LocConfig\AreaInfoController::class);
        Route::get('GetThana', [\App\Http\Controllers\LocConfig\AreaInfoController::class, 'GetThana']);
        Route::post('/AreaInfo/data', [\App\Http\Controllers\LocConfig\AreaInfoController::class, 'getData'])->name('AreaInfo.data');

        Route::resource('OutletInfo', \App\Http\Controllers\LocConfig\OutletInfoController::class);
        Route::get('GetArea', [\App\Http\Controllers\LocConfig\OutletInfoController::class, 'GetArea']);
        Route::post('/OutletInfo/data', [\App\Http\Controllers\LocConfig\OutletInfoController::class, 'getData'])->name('OutletInfo.data');

        Route::resource('WebSettings', \App\Http\Controllers\Settings\WebSettingsController::class);

        Route::resource('MenuPermission', \App\Http\Controllers\Menu\MenuPermissionController::class);

        Route::resource('product-stock', \App\Http\Controllers\Stock\ProductStockController::class);
        Route::post('/ProductStock/data', [\App\Http\Controllers\Stock\ProductStockController::class, 'getData'])->name('ProductStock.data');
        Route::get('/get-products', [\App\Http\Controllers\Stock\ProductStockController::class, 'getProducts']);
        Route::post('/submit-stock', [\App\Http\Controllers\Stock\ProductStockController::class, 'store']);

});
