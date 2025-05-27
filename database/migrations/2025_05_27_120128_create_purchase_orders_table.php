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
        Schema::create('purchase_orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('order_number')->unique('order_number');
            $table->text('place_delivery');
            $table->string('currency');
            $table->string('type_discount')->nullable();
            $table->text('payment_terms');
            $table->text('general_terms');
            $table->unsignedBigInteger('requester_id')->index('purchase_orders_requester_id_foreign');
            $table->text('suppling_duration');
            $table->string('total_gross');
            $table->integer('taxes');
            $table->float('discount', null, 0)->default(0);
            $table->string('total_after_discount');
            $table->string('with_holding')->nullable();
            $table->string('net_total');
            $table->string('remain_after_cheque')->nullable();
            $table->boolean('exist_comment')->default(false);
            $table->text('comment_virtual_po')->nullable();
            $table->unsignedBigInteger('supplier_id')->index('purchase_orders_supplier_id_foreign');
            $table->string('type_purchase_request', 200)->nullable();
            $table->char('type_purchase_order', 10)->nullable();
            $table->string('manufacturing_order_number')->nullable();
            $table->string('client_name')->nullable();
            $table->string('request_number_fabrication', 200)->nullable();
            $table->string('file_purchase_request')->nullable();
            $table->string('file_purchase_request_name')->nullable();
            $table->boolean('status_deactivate')->nullable()->default(false);
            $table->text('comment_deleted')->nullable();
            $table->string('delete_file_image_name')->nullable();
            $table->string('delete_file_image')->nullable();
            $table->bigInteger('delete_po_by')->nullable();
            $table->boolean('approved')->default(false);
            $table->boolean('sent')->default(false);
            $table->timestamps();
            $table->softDeletes();
            $table->integer('updated_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchase_orders');
    }
};
