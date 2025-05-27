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
        Schema::create('item_orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('purchase_order_id')->index('item_orders_purchase_order_id_foreign');
            $table->float('quantity', null, 0);
            $table->string('total');
            $table->string('price');
            $table->unsignedBigInteger('unit_id')->index('item_orders_unit_id_foreign');
            $table->integer('item_request_id');
            $table->text('comment')->nullable();
            $table->text('comment_refuse')->nullable();
            $table->boolean('approved')->default(true);
            $table->string('comment_reason')->nullable();
            $table->string('comment_item_refuse')->nullable();
            $table->float('used_quantity', null, 0);
            $table->text('specification')->nullable();
            $table->text('unit_new')->nullable();
            $table->text('comment_change_reason')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->unsignedBigInteger('action_comment_id')->nullable()->index('item_orders_action_comment_id_foreign');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('item_orders');
    }
};
