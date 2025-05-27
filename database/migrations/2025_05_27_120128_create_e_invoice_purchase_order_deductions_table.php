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
        Schema::create('e_invoice_purchase_order_deductions', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('deduction_id');
            $table->integer('price');
            $table->integer('purchase_order_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_purchase_order_deductions');
    }
};
