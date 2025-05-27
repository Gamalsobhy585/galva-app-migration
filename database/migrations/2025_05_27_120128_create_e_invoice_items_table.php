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
        Schema::create('e_invoice_items', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('purchase_order_id');
            $table->bigInteger('product_id');
            $table->bigInteger('quotation_item_id')->nullable();
            $table->text('description_ar')->nullable();
            $table->text('description_en')->nullable();
            $table->double('quantity', null, 0)->nullable();
            $table->string('currency', 10)->default('EGP');
            $table->string('unit', 30);
            $table->double('item_price', null, 0);
            $table->double('discount_item_rate', null, 0)->nullable();
            $table->double('discount_item_amount', null, 0)->nullable();
            $table->double('taxable_fees', null, 0)->nullable();
            $table->double('value_difference', null, 0)->nullable();
            $table->double('items_discount', null, 0)->nullable();
            $table->double('net_total', null, 0);
            $table->double('total_amount', null, 0);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_items');
    }
};
