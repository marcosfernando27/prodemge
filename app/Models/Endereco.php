<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Endereco extends Model
{
    use HasFactory;

    use HasFactory;

    protected $primaryKey = 'id_endereco';

    protected $table = 'enderecos';

    protected $fillable = [
        'cep',
        'logradouro',
        'numero',
        'complemento',
        'bairro',
        'estado',
        'cidade',
        'historico',
        'tipo_endereco_id',
        'pessoa_id'
    ];

    public function tipo_endereco(){
        return $this->belongsTo(TipoEndereco::class, 'tipo_endereco_id');
    }
}
