<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('enderecos', function (Blueprint $table) {
            $table->increments('id_endereco');
            $table->string('cep', 8);
            $table->string('logradouro', 128);
            $table->string('numero', 16)->nullable();
            $table->string('complemento', 24);
            $table->string('bairro', 64);
            $table->string('cidade', 64);
            $table->string('estado', 24);
            $table->boolean('historico')->nullable();
            $table->integer('pessoa_id')->unsigned()->index();
            $table->integer('tipo_endereco_id')->unsigned()->index();
            $table->foreign('pessoa_id')->references('id_pessoa')->on('pessoas');
            $table->foreign('tipo_endereco_id')->references('id_tipo_endereco')->on('tipos_enderecos');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enderecos');
    }
};
