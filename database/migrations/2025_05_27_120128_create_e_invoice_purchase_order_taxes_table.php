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
        Schema::create('e_invoice_purchase_order_taxes', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('item_id');
            $table->tinyInteger('tax_type')->nullable()->default(0);
            $table->string('subtype', 191)->nullable()->default('V06');
            $table->double('tax_rate', null, 0)->nullable()->default(0);
            $table->double('amount_tax', null, 0)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_purchase_order_taxes');
    }
};
