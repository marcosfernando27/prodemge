<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipoEndereco extends Model
{
    use HasFactory;

    use HasFactory;

    protected $primaryKey = 'id_tipo_endereco';

    protected $table = 'tipos_enderecos';

    protected $fillable = [
        'tipo'
    ];

    public function endereos(){
        return $this->hasMany(Endereco::class, 'tipo_endereco_id', 'id_tipo_endereco');
    }
}
