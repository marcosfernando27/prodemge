<?php

namespace App\Http\Controllers\Api;

use App\Models\TipoEndereco;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TiposEnderecosController extends Controller
{
    /**
     * listar tipos de endereços
     */
    public function index()
    {
        $tipo_endereco = TipoEndereco::query()
                        ->orderBy('tipo')
                        ->get();

        return json_encode($tipo_endereco);
    }

}
