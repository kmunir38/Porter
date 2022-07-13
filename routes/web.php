<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('tawkto', function() {
    return view('tawkto');
});

Route::get('/', function () {
    return redirect('/login');
});

Auth::routes([
  'register' => false, // Registration Routes...
  'reset' => false, // Password Reset Routes...
  'verify' => false, // Email Verification Routes...
]);

// Route::get('/', function () {
//     return redirect('home');
// });

// Route::get('/home', function () {
//     return redirect('admin/dashboard');
// });

Route::group(['namespace' => 'Admin', 'prefix' => 'admin', 'middleware' => ['auth']], function(){

	Route::group(['namespace' => 'Dashboard'], function (){
        Route::get('dashboard', 'DashboardController@index')->name('dashboard')->middleware('permission:dashboard-list');      
    });

	Route::group(['namespace' => 'Role'], function (){
		Route::get('roles', 'RoleController@index')->name('roles.index')->middleware('permission:role-list');
		Route::get('roles/create', 'RoleController@create')->name('roles.create')->middleware('permission:role-create');
		Route::post('roles', 'RoleController@store')->name('roles.store')->middleware('permission:role-create');
		Route::get('roles/{id}/edit', 'RoleController@edit')->name('roles.edit')->middleware('permission:role-edit');
		Route::put('roles/{id}', 'RoleController@update')->name('roles.update')->middleware('permission:role-edit');
		Route::any('roles/{id}/destroy', 'RoleController@destroy')->name('roles.destroy')->middleware('permission:role-delete');
	});

	Route::group(['namespace' => 'Permission'], function (){
		Route::get('permissions', 'PermissionController@index')->name('permissions.index')->middleware('permission:permission-list');
		Route::get('permissions/create', 'PermissionController@create')->name('permissions.create')->middleware('permission:permission-create');
		Route::post('permissions', 'PermissionController@store')->name('permissions.store')->middleware('permission:permission-create');
		Route::get('permissions/{id}/edit', 'PermissionController@edit')->name('permissions.edit')->middleware('permission:permission-edit');
		Route::put('permissions/{id}', 'PermissionController@update')->name('permissions.update')->middleware('permission:permission-edit');
		Route::any('permissions/{id}/destroy', 'PermissionController@destroy')->name('permissions.destroy')->middleware('permission:permission-delete');
	});

	Route::group(['namespace' => 'User'], function (){
		Route::get('users', 'UserController@index')->name('users.index')->middleware('permission:user-list');
		Route::get('users/create', 'UserController@create')->name('users.create')->middleware('permission:user-create');
		Route::post('users', 'UserController@store')->name('users.store')->middleware('permission:user-create');
		Route::get('users/{id}/edit', 'UserController@edit')->name('users.edit')->middleware('permission:user-edit');
		Route::put('users/{id}', 'UserController@update')->name('users.update')->middleware('permission:user-edit');
		Route::any('users/{id}/destroy', 'UserController@destroy')->name('users.destroy')->middleware('permission:user-delete');
	});


    Route::group(['namespace' => 'Customer'], function (){
        Route::get('customers', 'CustomerController@index')->name('customers.index')->middleware('permission:customer-list');
        Route::get('customers/create', 'CustomerController@create')->name('customers.create')->middleware('permission:customer-create');
        Route::post('customers', 'CustomerController@store')->name('customers.store')->middleware('permission:customer-create');
        Route::get('customers/{id}/edit', 'CustomerController@edit')->name('customers.edit')->middleware('permission:customer-edit');
        Route::put('customers/{id}', 'CustomerController@update')->name('customers.update')->middleware('permission:customer-edit');
        Route::any('customers/{id}/destroy', 'CustomerController@destroy')->name('customers.destroy')->middleware('permission:customer-delete');
    });

    Route::group(['namespace' => 'Rider'], function (){
        Route::get('riders', 'RiderController@index')->name('riders.index')->middleware('permission:rider-list');
        Route::get('riders/create', 'RiderController@create')->name('riders.create')->middleware('permission:rider-create');
        Route::post('riders', 'RiderController@store')->name('riders.store')->middleware('permission:rider-create');
        Route::get('riders/{id}/edit', 'RiderController@edit')->name('riders.edit')->middleware('permission:rider-edit');
        Route::put('riders/{id}', 'RiderController@update')->name('riders.update')->middleware('permission:rider-edit');
        Route::any('riders/{id}/destroy', 'RiderController@destroy')->name('riders.destroy')->middleware('permission:rider-delete');

        Route::get('riders/rider-details', 'RiderDetailController@index')->name('riders.rider-detail.index')->middleware('permission:rider-detail-list');
        Route::get('riders/rider-details/{id}/view', 'RiderDetailController@view')->name('riders.rider-detail.view')->middleware('permission:rider-detail-view');

    });

	Route::group(['namespace' => 'Restaurant'], function (){
        Route::get('restaurants', 'IndexController@index')->name('restaurant.index')->middleware('permission:restaurant-list');
        Route::get('restaurants/create', 'IndexController@create')->name('restaurant.create')->middleware('permission:restaurant-create');
        Route::post('restaurants', 'IndexController@store')->name('restaurant.store')->middleware('permission:restaurant-create');
        Route::get('restaurants/{id}/edit', 'IndexController@edit')->name('restaurant.edit')->middleware('permission:restaurant-edit');
        Route::put('restaurants/{id}', 'IndexController@update')->name('restaurant.update')->middleware('permission:restaurant-edit');
        Route::any('restaurants/{id}/destroy', 'IndexController@destroy')->name('restaurant.destroy')->middleware('permission:restaurant-delete');
    });

    Route::group(['namespace' => 'Shopper'], function (){
        Route::get('shoppers', 'IndexController@index')->name('shopper.index')->middleware('permission:shopper-list');
        Route::get('shoppers/create', 'IndexController@create')->name('shopper.create')->middleware('permission:shopper-create');
        Route::post('shoppers', 'IndexController@store')->name('shopper.store')->middleware('permission:shopper-create');
        Route::get('shoppers/{id}/edit', 'IndexController@edit')->name('shopper.edit')->middleware('permission:shopper-edit');
        Route::put('shoppers/{id}', 'IndexController@update')->name('shopper.update')->middleware('permission:shopper-edit');
        Route::any('shoppers/{id}/destroy', 'IndexController@destroy')->name('shopper.destroy')->middleware('permission:shopper-delete');
        Route::get('assinging-grocery/{id}', 'IndexController@getAssignView')->name('shopper.assign')->middleware('permission:shopper-delete');
        Route::post('assinging-grocery/{id}', 'IndexController@assignGrocery')->name('shopper.assignGrocery')->middleware('permission:shopper-delete');
    });

     Route::group(['namespace' => 'Grocery'], function (){
        Route::get('groceries', 'IndexController@index')->name('grocery.index')->middleware('permission:grocery-list');
        Route::get('groceries/create', 'IndexController@create')->name('grocery.create')->middleware('permission:grocery-create');
        Route::post('groceries', 'IndexController@store')->name('grocery.store')->middleware('permission:grocery-create');
        Route::get('groceries/{id}/edit', 'IndexController@edit')->name('grocery.edit')->middleware('permission:grocery-edit');
        Route::put('groceries/{id}', 'IndexController@update')->name('grocery.update')->middleware('permission:grocery-edit');
        Route::any('groceries/{id}/destroy', 'IndexController@destroy')->name('grocery.destroy')->middleware('permission:grocery-delete');
    });

    Route::group(['namespace' => 'Item'], function (){
        Route::get('items', 'IndexController@index')->name('item.index')->middleware('permission:item-list');
        Route::get('items/create', 'IndexController@create')->name('item.create')->middleware('permission:item-create');
        Route::post('items', 'IndexController@store')->name('item.store')->middleware('permission:item-create');
        Route::get('items/{id}/edit', 'IndexController@edit')->name('item.edit')->middleware('permission:item-edit');
        Route::put('items/{id}', 'IndexController@update')->name('item.update')->middleware('permission:item-edit');
        Route::any('items/{id}/destroy', 'IndexController@destroy')->name('item.destroy')->middleware('permission:item-delete');
    });

    Route::group(['namespace' => 'Category'], function (){
        Route::get('categories', 'IndexController@index')->name('category.index')->middleware('permission:category-list');
        Route::get('category/create', 'IndexController@create')->name('category.create')->middleware('permission:category-create');
        Route::post('category', 'IndexController@store')->name('category.store')->middleware('permission:category-create');
        Route::get('category/{id}/edit', 'IndexController@edit')->name('category.edit')->middleware('permission:category-edit');
        Route::put('category/{id}', 'IndexController@update')->name('category.update')->middleware('permission:category-edit');
        Route::any('category/{id}/destroy', 'IndexController@destroy')->name('category.destroy')->middleware('permission:category-delete');
    });

    Route::group(['namespace' => 'Expertise'], function (){
        Route::get('expertise', 'IndexController@index')->name('expertise.index')->middleware('permission:expertise-list');
        Route::get('expertise/create', 'IndexController@create')->name('expertise.create')->middleware('permission:expertise-create');
        Route::post('expertise', 'IndexController@store')->name('expertise.store')->middleware('permission:expertise-create');
        Route::get('expertise/{id}/edit', 'IndexController@edit')->name('expertise.edit')->middleware('permission:expertise-edit');
        Route::put('expertise/{id}', 'IndexController@update')->name('expertise.update')->middleware('permission:expertise-edit');
        Route::any('expertise/{id}/destroy', 'IndexController@destroy')->name('expertise.destroy')->middleware('permission:expertise-delete');
    });

    Route::group(['namespace' => 'Coupon'], function (){
        Route::get('coupons', 'IndexController@index')->name('coupon.index')->middleware('permission:coupon-list');
        Route::get('coupons/create', 'IndexController@create')->name('coupon.create')->middleware('permission:coupon-create');
        Route::post('coupons', 'IndexController@store')->name('coupon.store')->middleware('permission:coupon-create');
        Route::get('coupons/{id}/edit', 'IndexController@edit')->name('coupon.edit')->middleware('permission:coupon-edit');
        Route::put('coupons/{id}', 'IndexController@update')->name('coupon.update')->middleware('permission:coupon-edit');
        Route::any('coupons/{id}/destroy', 'IndexController@destroy')->name('coupon.destroy')->middleware('permission:coupon-delete');
    });

    Route::group(['namespace' => 'Content'], function() {
        Route::get('contents', 'IndexController@index')->name('contents.index');    
        Route::get('contents/edit/{id}', 'IndexController@edit')->name('contents.edit');    
        Route::post('contents/update/{id}', 'IndexController@update')->name('contents.update');
    });

    Route::group(['namespace' => 'Logs'], function() {
        Route::get('logs', 'IndexController@index')->name('logs.index')->middleware('permission:log-list');
        Route::post('logs/search', 'IndexController@logsSearch')->name('logs.search')->middleware('permission:log-list');
    });

    Route::group(['namespace' => 'Setting'], function (){
        Route::get('settings', 'IndexController@index')->name('settings.index')->middleware('permission:setting-list');
        Route::post('settings', 'IndexController@store')->name('settings.store')->middleware('permission:setting-list');      
    });
});
