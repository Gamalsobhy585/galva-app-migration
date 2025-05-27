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
        Schema::create('person_suppliers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->nullable();
            $table->string('job')->nullable();
            $table->string('mobile', 16)->nullable();
            $table->string('whatsapp', 16)->nullable();
            $table->string('email')->nullable();
            $table->unsignedBigInteger('supplier_id')->index('person_suppliers_supplier_id_foreign');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('person_suppliers');
    }
};
