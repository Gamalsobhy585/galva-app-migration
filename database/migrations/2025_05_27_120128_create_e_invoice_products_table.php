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
        Schema::create('e_invoice_products', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->char('uuid', 36)->nullable();
            $table->string('product_name', 191);
            $table->string('internal_code', 191)->unique('products_internal_code_unique');
            $table->string('product_code', 191)->unique('products_product_code_unique');
            $table->enum('standard_code_type', ['GS1', 'EGS'])->comment('This column is type of standard code of product');
            $table->boolean('approved')->default(false);
            $table->timestamps();
            $table->string('deleted_by')->nullable();
            $table->dateTime('updated_by')->nullable();
            $table->integer('created_by')->nullable();
            $table->dateTime('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_products');
    }
};
