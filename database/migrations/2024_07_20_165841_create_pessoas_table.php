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
        Schema::create('pessoas', function (Blueprint $table) {
            $table->increments('id_pessoa');
            $table->string('nome', 128)->nullable();;
            $table->string('nome_social', 128);
            $table->string('cpf', 11);
            $table->string('nome_pai', 128);
            $table->string('nome_mae', 128);
            $table->string('telefone', 11);
            $table->string('email', 128);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pessoas');
    }
};
