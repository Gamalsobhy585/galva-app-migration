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
        Schema::create('supplier_bank_transfers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('bank_account_number');
            $table->string('bank_name');
            $table->string('bank_branch');
            $table->string('bank_currency');
            $table->string('bank_ibn')->nullable();
            $table->string('bank_swift')->nullable();
            $table->unsignedBigInteger('supplier_id')->index('supplier_bank_transfers_supplier_id_foreign');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('supplier_bank_transfers');
    }
};
