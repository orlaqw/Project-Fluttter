<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\MovieController;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
//USER
Route::post('register_admin', [AuthController::class, "register"]);
Route::get("/get_user",[AuthController::class,"getUser"]);
Route::get("/get_detail_user/{id}",[AuthController::class,"getDetailUser"]);
Route::put("/update_user/{id}",[AuthController::class,"update_user"]); //variable {id} ini artinya endpoint ini mengandung nilai parameter di url yang disimpan kedalam variable dengan nama ID.
Route::delete("/hapus_user/{id}",[AuthController::class,"hapus_user"]);

//CATEGORY
Route::post('create_category', [CategoryController::class, "createCategory"]);
Route::get("/get_category",[CategoryController::class,"getCategory"]);
Route::get("/get_detail_category/{id}",[CategoryController::class,"getDetailCategory"]);
Route::put("/update_category/{id}",[CategoryController::class,"update_category"]); //variable {id} ini artinya endpoint ini mengandung nilai parameter di url yang disimpan kedalam variable dengan nama ID.
Route::delete("/hapus_category/{id}",[CategoryController ::class,"hapus_category"]);

//MOVIE
Route::post('create_movie', [MovieController::class, "createMovie"]);
Route::get("/get_movie",[MovieController::class,"getMovie"]);
Route::get("/get_detail_movie/{id}",[MovieController::class,"getDetailMovie"]);
Route::put("/update_movie/{id}",[MovieController::class,"update_movie"]); //variable {id} ini artinya endpoint ini mengandung nilai parameter di url yang disimpan kedalam variable dengan nama ID.
Route::delete("/hapus_movie/{id}",[MovieController ::class,"hapus_movie"]);