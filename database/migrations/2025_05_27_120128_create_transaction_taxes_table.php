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
        Schema::create('transaction_taxes', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('year');
            $table->date('delivery_date')->nullable();
            $table->string('payment_receipt_number', 191)->nullable();
            $table->string('payment_receipt_value', 191)->nullable();
            $table->integer('bank_id')->nullable();
            $table->string('delivery_period', 191);
            $table->string('tax_period', 191);
            $table->string('fileName', 191)->nullable();
            $table->string('originalName', 191)->nullable();
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transaction_taxes');
    }
};
