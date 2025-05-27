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
        Schema::create('crm_issuing_quotation_items', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('quotation_id')->nullable();
            $table->text('description')->nullable();
            $table->string('unit', 191)->nullable();
            $table->string('quantity', 191)->nullable();
            $table->integer('currency')->nullable();
            $table->string('unit_wight', 100)->nullable();
            $table->string('price', 191)->nullable();
            $table->string('sub_total', 191)->nullable();
            $table->integer('created_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_issuing_quotation_items');
    }
};
