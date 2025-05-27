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
        Schema::create('e_invoice_payment_deductions', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('deduction_id');
            $table->integer('quantity')->nullable();
            $table->decimal('value', 50, 30);
            $table->text('description')->nullable();
            $table->bigInteger('payment_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_payment_deductions');
    }
};
