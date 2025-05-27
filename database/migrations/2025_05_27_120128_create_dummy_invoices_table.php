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
        Schema::create('dummy_invoices', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('uuid', 191);
            $table->integer('supplier_id');
            $table->string('invoice_number', 191);
            $table->date('date_invoice');
            $table->string('total', 191);
            $table->string('value_tax', 191);
            $table->string('overall_total', 191);
            $table->string('other_discount', 191);
            $table->string('total_after_discount', 191);
            $table->string('tax_deduction_value', 191);
            $table->string('net_total', 191);
            $table->integer('created_by');
            $table->timestamps();
            $table->integer('transaction_taxes_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dummy_invoices');
    }
};
