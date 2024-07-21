<?php

namespace App\Http\Controllers\Api;

use App\Models\Endereco;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class EnderecoController extends Controller
{

    /**
     * Salvar endereço
     */
    public function store(Request $request)
    {
        DB::beginTransaction();

        try {
        // retornar enderecos
        $enderecos = Endereco::select('id_endereco')
                            ->where('pessoa_id', $request->pessoa_id)
                            ->get();


        // contagem de enderecos
        if($enderecos->count() > 0) :
            foreach($enderecos as $e) :

                $endereco = Endereco::find($e->id_endereco);

                // historico = true significa que está em histórico
                $endereco->historico = true;
                $endereco->update();

            endforeach;
        endif;

        $data                   = $request->all();
        $data['cep']            = tratar_cep($data['cep']);
        // false: É o endereço atual
        $data['historico']      = false;

        // save endereços
        Endereco::create($data);

        DB::commit();

        return json_encode($data);

        } catch (\Exception $e) {
            DB::rollback();
            return "Error:  " . $e->getMessage();
        }
    }


    /**
     * show endereços
     */
    public function show($id)
    {
        $data = Endereco::with('tipo_endereco')
                ->where('pessoa_id', $id)
                ->orderBy('created_at', 'desc')
                ->get();

        return json_encode($data);
    }


    /**
     * traz enderecos pelo ID da pessoa
     */
    public function edit($id)
    {
        $data = Endereco::with('tipo_endereco')
                        ->where('pessoa_id', $id)
                        ->where('historico', false)
                        ->first();

        return json_encode($data);
    }

}
