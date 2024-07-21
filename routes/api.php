<?php

use App\Http\Controllers\Api\ApiCep;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PessoaController;
use App\Http\Controllers\Api\EnderecoController;
use App\Http\Controllers\Api\TiposEnderecosController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::prefix('pessoas')->group(function () {
    Route::post('/store', [PessoaController::class, 'store'])->name('pessoas.store');
    Route::get('/', [PessoaController::class, 'index'])->name('pessoas.index');
});

Route::prefix('enderecos')->group(function () {
    Route::post('/store', [EnderecoController::class, 'store'])->name('enderecos.store');
    Route::get('/show/{id}', [EnderecoController::class, 'show'])->name('enderecos.show');
    Route::get('/edit/{id}', [EnderecoController::class, 'edit'])->name('enderecos.edit');
});

Route::prefix('tipos_enderecos')->group(function () {
    Route::get('/', [TiposEnderecosController::class, 'index'])->name('tipos_enderecos.index');
});

Route::prefix('api_cep')->group(function () {
    Route::get('/{cep}', [ApiCep::class, 'index'])->name('api_cep.index');
});
