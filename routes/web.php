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

Route::view('/', 'welcome')->name('home');


Route::resource('collection', 'CollectionController')->only('store');
Route::get('collection/new', 'CollectionController@new')->name('collection.new');

Route::resource('payment', 'PaymentController')->only('store');
Route::get('collection/{collection}/payment/new', 'PaymentController@new')->name('payment.new');

Route::resource('unsettled-payment', 'UnsettledPaymentController')->only('index');
