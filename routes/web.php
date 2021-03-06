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


Route::get('collection/new', 'CollectionController@new')->name('collection.new');
Route::get('collection/{collection}/edit', 'CollectionController@edit')->name('collection.edit');
Route::resource('collection', 'CollectionController')->only(['store', 'show', 'update']);

Route::resource('payment', 'PaymentController')->only(['store','update', 'destroy']);
Route::get('payment/{payment}/edit', 'PaymentController@edit')->name('payment.edit');
Route::get('collection/{collection}/payment/new', 'PaymentController@new')->name('payment.new');

Route::resource('collection/{collection}/unsettled-payment', 'UnsettledPaymentController')->only('index');
