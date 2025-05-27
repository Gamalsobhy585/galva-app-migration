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
        Schema::create('supplier_cheques', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('name_on_cheque');
            $table->string('name_on_cheque_to_bank', 200)->nullable();
            $table->unsignedBigInteger('supplier_id')->index('supplier_cheques_supplier_id_foreign');
            $table->tinyInteger('edited_name')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('supplier_cheques');
    }
};
