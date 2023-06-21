<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\TaskController;


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

Route::get('/', function () {
    return redirect('/login');
});

Auth::routes();
Route::group(['middleware'=> 'auth'], function (){
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('home');
    // Task Management
    Route::resource('tasks', TaskController::class);
    // Task Assignment
    Route::post('/tasks/{task}/assign', [TaskController::class, 'assign']);
    // Task Notifications
   Route::post('/tasks/{task}/status', [TaskController::class, 'updateStatus']);

});


