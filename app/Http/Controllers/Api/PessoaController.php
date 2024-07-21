<?php

namespace App\Http\Controllers\Api;

use App\Models\Pessoa;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class PessoaController extends Controller
{
    /**
     * listar todas a pessoas de ordem crescente por nome
     */
    public function index()
    {
        $pessoas = Pessoa::query()
                    ->orderBy('nome')
                    ->get();

        return json_encode($pessoas);
    }


    /**
     * salvar pessoa no db
     */
    public function store(Request $request)
    {

        DB::beginTransaction();

        $data                   = $request->all();
        $data['nome']           = tratar_nome($data['nome']);
        $data['nome_social']    = tratar_nome($data['nome_social']);
        $data['nome_pai']       = tratar_nome($data['nome_pai']);
        $data['nome_mae']       = tratar_nome($data['nome_mae']);
        $data['cpf']            = tratar_cpf($data['cpf']);
        $data['telefone']       = tratar_fone($data['telefone']);

        Pessoa::create($data);

        DB::commit();

        return json_encode($data);

    }
}
