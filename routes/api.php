<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'v1', 'namespace' => 'Api'], function() {

	// Customer Auth Start Created By MYTECH MAESTRO
	Route::group(['prefix' => 'customer'], function() {

        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@register');
        Route::post('verify-otp', 'AuthController@verifyOtp');
        Route::post('resend-otp', 'AuthController@resendOtp');
        Route::get('forgot-password', 'AuthController@forgetPassword');
        Route::post('reset-password', 'AuthController@resetPassword');

        Route::group(['prefix' => 'social'], function() 
        {
            Route::post('/google', 'AuthController@googleSignIn');
            Route::post('/facebook', 'AuthController@facebookSignIn');
            Route::post('/apple', 'AuthController@appleSignIn');
        });

        Route::group(['middleware' => 'auth:api'], function() 
        {
            Route::get('/getProfile', 'AuthController@getProfile');
            Route::get('/user-profile', 'AuthController@userProfile');
            Route::post('change-password', 'AuthController@changePassword');
            Route::post('/update-profile', 'AuthController@UpdateProfile');
            Route::post('saveUserDeviceToken', 'AuthController@saveUserDeviceToken');
            Route::get('sign-out', 'AuthController@signOut');
        
        Route::group(['namespace' => 'Customer'], function()
        {
            Route::get('address', 'AddressController@index');
            Route::get('order-history', 'IndexController@orderHistory');
            Route::get('desserts', 'IndexController@desserts');
            Route::get('order-details', 'IndexController@orderDetails');
        });
        
        Route::post('addRemove', 'AuthController@AddRemove');        

      });
    });

    Route::group(['prefix' => 'rider'], function() {

        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@register');
        Route::post('verify-otp', 'AuthController@verifyOtp');
        Route::post('resend-otp', 'AuthController@resendOtp');
        Route::get('forgot-password', 'AuthController@forgetPassword');
        Route::post('reset-password', 'AuthController@resetPassword');

        Route::group(['prefix' => 'social'], function() 
        {
            Route::post('/google', 'AuthController@googleSignIn');
            Route::post('/facebook', 'AuthController@facebookSignIn');
            Route::post('/apple', 'AuthController@appleSignIn');
        });

        Route::group(['middleware' => 'auth:api'], function() 
        {
            Route::get('/getProfile', 'AuthController@riderProfile');
            Route::get('/user-profile', 'AuthController@userProfile');
            Route::post('change-password', 'AuthController@changePassword');
            Route::post('/update-profile', 'AuthController@UpdateProfile');
            Route::post('saveUserDeviceToken', 'AuthController@saveUserDeviceToken');
            Route::get('sign-out', 'AuthController@signOut');

        Route::group(['namespace' => 'Rider'], function()
        {
            Route::get('order-history', 'IndexController@orderHistory');
            Route::post('bank-info', 'IndexController@bankInfo');
            Route::post('add-vehicle', 'IndexController@addVehicle');
        });
      });
    });

    Route::group(['prefix' => 'restaurent'], function() {

        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@register');
        Route::post('verify-otp', 'AuthController@verifyOtp');
        Route::post('resend-otp', 'AuthController@resendOtp');
        Route::get('forgot-password', 'AuthController@forgetPassword');
        Route::post('reset-password', 'AuthController@resetPassword');

        Route::group(['prefix' => 'social'], function() 
        {
            Route::post('/google', 'AuthController@googleSignIn');
            Route::post('/facebook', 'AuthController@facebookSignIn');
            Route::post('/apple', 'AuthController@appleSignIn');
        });

        Route::group(['middleware' => 'auth:api'], function() 
        {
            Route::get('/getProfile', 'AuthController@getProfile');
            Route::post('change-password', 'AuthController@changePassword');
            Route::post('/update-profile', 'AuthController@UpdateProfile');
            Route::post('saveUserDeviceToken', 'AuthController@saveUserDeviceToken');
            Route::get('sign-out', 'AuthController@signOut');
            Route::group(['namespace' => 'Restaurent'], function()
            {
                Route::get('order-history', 'IndexController@orderHistory');
                Route::get('profile', 'IndexController@profile');
            });    
        });        
    });

    Route::group(['prefix' => 'shopper'], function() {

        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@register');
        Route::post('verify-otp', 'AuthController@verifyOtp');
        Route::post('resend-otp', 'AuthController@resendOtp');
        Route::get('forgot-password', 'AuthController@forgetPassword');
        Route::post('reset-password', 'AuthController@resetPassword');

        Route::group(['prefix' => 'social'], function() 
        {
            Route::post('/google', 'AuthController@googleSignIn');
            Route::post('/facebook', 'AuthController@facebookSignIn');
            Route::post('/apple', 'AuthController@appleSignIn');
        });

        Route::group(['middleware' => 'auth:api'], function() 
        {
            Route::get('/getProfile', 'AuthController@getProfile');
            Route::post('change-password', 'AuthController@changePassword');
            Route::post('/update-profile', 'AuthController@UpdateProfile');
            Route::post('saveUserDeviceToken', 'AuthController@saveUserDeviceToken');
            Route::get('sign-out', 'AuthController@signOut');
            Route::group(['namespace' => 'Shopper'], function()
            {
                Route::get('order-history', 'IndexController@orderHistory');
            });            
        });
    }); 

    Route::group(['prefix' => 'grocery'], function() {
        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@register');
        Route::post('verify-otp', 'AuthController@verifyOtp');
        Route::post('resend-otp', 'AuthController@resendOtp');
        Route::get('forgot-password', 'AuthController@forgetPassword');
        Route::post('reset-password', 'AuthController@resetPassword');

        Route::group(['prefix' => 'social'], function() 
        {
            Route::post('/google', 'AuthController@googleSignIn');
            Route::post('/facebook', 'AuthController@facebookSignIn');
            Route::post('/apple', 'AuthController@appleSignIn');
        });

        Route::group(['middleware' => 'auth:api'], function() {
            Route::get('/getProfile', 'AuthController@getProfile');
            Route::post('change-password', 'AuthController@changePassword');
            Route::post('/update-profile', 'AuthController@UpdateProfile');
            Route::post('saveUserDeviceToken', 'AuthController@saveUserDeviceToken');
            Route::get('sign-out', 'AuthController@signOut');
            Route::group(['namespace' => 'Grocery'], function()
            {
                Route::get('order-history', 'IndexController@orderHistory');
            });            
        });
    }); 

    Route::group(['middleware' => 'auth:api'], function(){

        Route::group(['prefix' => 'items', 'namespace' => 'items', ], function(){
            Route::get('/', 'IndexController@index');
            Route::post('/create', 'IndexController@store');
            Route::post('/update', 'IndexController@update');
            Route::get('/view', 'IndexController@singleItem');
            Route::post('/delete', 'IndexController@destroy');
            Route::post('/search-filter', 'IndexController@searchFilter');
            Route::get('/latest-offers', 'IndexController@latestOffers');
        });

        Route::group(['prefix' => 'contents', 'namespace' => 'Content'], function() {
            Route::get('/', 'IndexController@index');        
        });  

        Route::group(['prefix' => 'orders', 'namespace' => 'Order'], function() {
            Route::post('place', 'IndexController@store');
            Route::post('accept', 'IndexController@acceptOrder');
            Route::post('reject', 'IndexController@rejectOrder');
            Route::get('past-orders', 'IndexController@pastOrders');
            Route::get('new-orders', 'IndexController@newOrders');
            Route::get('view-order', 'IndexController@singleOrder');        
        });
    });        
}); 