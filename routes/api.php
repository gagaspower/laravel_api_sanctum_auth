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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::post('login', 'AuthController@login');
Route::post('/registrasi','Registrasi@create');

Route::group(['prefix' => 'auth', 'middleware' => 'auth:sanctum'], function() {
    Route::get('/user','AuthController@getCurrentUser');
    Route::put('/user/update','AuthCOntroller@updateUser');
    Route::post('logout', 'AuthController@logout');
    Route::post('logoutall', 'AuthController@logoutall');
});

Route::group(['prefix' => 'booking', 'middleware' => 'auth:sanctum'], function() {
    Route::get('/riwayat','Booking@index');
    Route::get('/kodebooking','Booking@getNumber');
    Route::post('/order','Booking@create');
    Route::get('/detail/{id}','Booking@show');
});