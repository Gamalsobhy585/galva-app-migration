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
        Schema::create('e_invoice_banks', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('bank_code', 191)->unique('banks_bank_code_unique');
            $table->string('bank_name', 191);
            $table->string('currency', 191);
            $table->string('bank_account_number', 191);
            $table->string('bank_account_iban', 191);
            $table->string('swift_code', 191);
            $table->string('bank_address', 191);
            $table->boolean('approved')->default(false);
            $table->timestamps();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->string('uuid', 36)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_banks');
    }
};
