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
        Schema::create('material_receipts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('recipient_name');
            $table->unsignedBigInteger('item_order_id')->index('material_receipts_item_order_id_foreign');
            $table->string('quantity_received', 11)->nullable();
            $table->integer('receipt_number');
            $table->dateTime('recipient_date');
            $table->text('location');
            $table->string('image')->nullable();
            $table->string('image_file')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('material_receipts');
    }
};
