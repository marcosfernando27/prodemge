<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;


class ApiCep extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index($cep)
    {
        try {
        $cepData = Http::get("https://viacep.com.br/ws/{$cep}/json/")
                    ->throw()->json();

        return json_encode($cepData);

        } catch (\Exception $e) {
            echo json_encode('Error: ' . $e);
        }
    }

}
