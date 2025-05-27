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
        Schema::create('e_invoice_document_taxes', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('document_item_id');
            $table->bigInteger('purchase_order_tax_id');
            $table->double('amount_tax', null, 0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_document_taxes');
    }
};
