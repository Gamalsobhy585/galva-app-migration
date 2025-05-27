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
        Schema::create('e_invoice_purchase_order_taxes_details', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('purchase_order_id');
            $table->integer('tax_type_id')->comment('primary key in table tax_type');
            $table->string('sub_type', 50)->comment('version type in table version_type_taxes');
            $table->integer('tax_rate');
            $table->integer('amount_tax');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_purchase_order_taxes_details');
    }
};
