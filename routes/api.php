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
    // Route::get('app', 'Coupon\IndexController@index');

	// Customer Auth Start Created By MYTECH MAESTRO
	Route::group(['prefix' => 'customer'], function() {

        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@register');
        Route::post('verify-otp', 'AuthController@verifyOtp');
        Route::post('resend-otp', 'AuthController@resendOtp');
        Route::post('forgot-password', 'AuthController@forgetPassword');
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
            Route::post('address/add', 'AddressController@create');
            Route::post('address/update', 'AddressController@update');
            Route::get('order-history', 'IndexController@orderHistory');
            Route::get('desserts', 'IndexController@desserts');
            Route::get('order-details', 'IndexController@orderDetails');
            Route::get('home', 'IndexController@home');
            Route::post('delivery-cost', 'IndexController@getDeliveryCost');
        });        
            Route::post('addRemove', 'AuthController@AddRemove');  
      });
    });

    Route::group(['prefix' => 'rider'], function() {

        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@riderSignup');
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
            Route::post('updateCoordinate', 'AuthController@updateCoordinate');
            Route::get('sign-out', 'AuthController@signOut');

        Route::group(['namespace' => 'Rider'], function()
        {
            Route::get('order-history', 'IndexController@orderHistory');
            Route::post('bank-info', 'IndexController@bankInfo');
            Route::post('add-vehicle', 'IndexController@addVehicle');
            Route::get('balance-page', 'IndexController@balancePage');
            Route::get('cash-OrderHistory', 'IndexController@cashOrders');
            Route::get('card-OrderHistory', 'IndexController@cardOrders');
            Route::get('new-order', 'IndexController@newOrder');
            Route::get('countcashorders', 'IndexController@countCashOrders'); 
            Route::post('update-locations', 'IndexController@updateRiderLocation'); 
        });
      });
    });

    Route::group(['prefix' => 'vendor'], function() {

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
            Route::get('/getRestProfile', 'AuthController@getRestProfile');
            Route::post('change-password', 'AuthController@changePassword');
            Route::post('/update-profile', 'AuthController@UpdateProfile');
            Route::post('saveUserDeviceToken', 'AuthController@saveUserDeviceToken');
            Route::get('sign-out', 'AuthController@signOut');
            Route::group(['namespace' => 'Vendor'], function()
            {
                Route::get('order-history', 'IndexController@orderHistory');
                Route::get('profile', 'IndexController@profile');
                Route::get('all', 'IndexController@getAllRestaurants');
            });      
        });
    });

    Route::group(['prefix' => 'coupons', 'namespace' => 'Coupon'], function()
    {
        Route::get('/', 'IndexController@index');
        Route::post('/store', 'IndexController@store');
        Route::post('/update', 'IndexController@update');
        Route::post('/delete', 'IndexController@destroy');
        Route::get('/verify-coupon', 'IndexController@verifyPromo');
    });

    Route::group(['prefix' => 'shopper'], function() {

        Route::post('login', 'AuthController@login');
        Route::post('register', 'AuthController@register');
        Route::post('verify-otp', 'AuthController@verifyOtp');
        Route::post('resend-otp', 'AuthController@resendOtp');
        Route::post('forgot-password', 'AuthController@forgetPassword');
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
            // Route::get('/getProfile', 'AuthController@getProfile');
            Route::post('change-password', 'AuthController@changePassword');
            Route::post('/update-profile', 'AuthController@UpdateProfile');
            Route::post('saveUserDeviceToken', 'AuthController@saveUserDeviceToken');
            Route::get('sign-out', 'AuthController@signOut');
            Route::group(['namespace' => 'Grocery'], function()
            {
                Route::get('/getProfile', 'IndexController@Profile');
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
            Route::get('/getByCategory', 'IndexController@getItemsbyCategory');
            Route::get('/getByUser', 'IndexController@getItemsbyUser');
            Route::get('/popular', 'IndexController@popularItems');
            Route::post('/searchFood', 'IndexController@searchItem');
            Route::get('/getRestaurantCategories', 'IndexController@getRestaurantCategories');
            Route::get('/getGroceryCategories', 'IndexController@getGroceryCategories');
            Route::get('/getRecentItems', 'IndexController@getRecentItems');
            Route::get('/getAllDiscounted', 'IndexController@getAllDiscounted');
            Route::get('/getItemsByExpertise', 'IndexController@getItemsByExpertise');
            Route::get('/getAllExpertise', 'IndexController@getAllExpertise');
        });        

        Route::group(['prefix' => 'orders', 'namespace' => 'Order'], function() {
            Route::post('place', 'IndexController@store');
            Route::post('accept', 'IndexController@acceptOrder');
            Route::post('reject', 'IndexController@rejectOrder');
            Route::get('past-orders', 'IndexController@pastOrders');
            Route::get('new-orders', 'IndexController@newOrders');
            Route::get('getitems', 'IndexController@getAllOrderItems');
            Route::get('view-order', 'IndexController@singleOrder');        
            Route::post('complete-order', 'IndexController@completeOrder');        
            Route::post('ready-order', 'IndexController@readyOrder');        
            Route::get('getOrderView', 'IndexController@getOrderView');        
            Route::post('assign', 'IndexController@assignOrder');        
                   
        });
        Route::group(['namespace' => 'Notification', 'prefix' => 'notification'], function() {
            Route::get('/', 'IndexController@index');           
        });

        Route::group(['namespace' => 'Card', 'prefix' => 'cards'], function() {
            Route::get('/', 'IndexController@index');   
            Route::post('/add', 'IndexController@create');
            Route::post('/update', 'IndexController@updateStatus'); 
        });

        Route::group(['prefix' => 'saveDeviceToken'], function() {
            Route::post('/', 'AuthController@saveDeviceToken');              
        });  
    });  
    Route::group(['prefix' => 'contents', 'namespace' => 'Content'], function() {
            Route::get('/', 'IndexController@index');        
    });  

}); 