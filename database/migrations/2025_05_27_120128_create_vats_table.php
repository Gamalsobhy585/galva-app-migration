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
        Schema::create('vats', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid');
            $table->string('year', 50);
            $table->string('month', 50);
            $table->integer('bank_id')->nullable();
            $table->string('payment_receipt_number', 191)->nullable();
            $table->string('payment_receipt_value')->nullable();
            $table->string('delivery_date', 191)->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vats');
    }
};
