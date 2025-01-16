<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->integer("id")->autoIncrement(); //id sebagai 
            $table->string('name');
            $table->string('email')->unique(); //data uniqe tidak boleh sama/ beda
            $table->string("address"); //nullable boleh kosong
            $table->date("birthday");
            $table->enum("role",["admin","kasir"]); //enum adalah data pilihan contoh perempuan/ laki2/ dll, terserah sistem
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps(); //created_at dan updated_at/ mengetahui update data/ histori, jika hilang ketika migrate tidak ada waktu update
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
