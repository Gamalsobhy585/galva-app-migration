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
        Schema::create('inquiry_purchase_requests', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('purchase_request_id')->nullable()->index('inquiry_purchase_requests_purchase_request_id_foreign');
            $table->unsignedBigInteger('item_request_id')->nullable()->index('inquiry_purchase_requests_item_request_id_foreign');
            $table->string('send_message')->nullable();
            $table->string('receive_message')->nullable();
            $table->text('edit_item')->nullable();
            $table->string('approve')->default('0');
            $table->unsignedBigInteger('send_id')->nullable()->index('inquiry_purchase_requests_send_id_foreign');
            $table->unsignedBigInteger('receive_id')->nullable()->index('inquiry_purchase_requests_receive_id_foreign');
            $table->string('file')->nullable();
            $table->string('file_name')->nullable();
            $table->string('alternate')->nullable();
            $table->integer('technical_office');
            $table->string('approve_technical_office')->default('0');
            $table->dateTime('aprove_first_date')->nullable();
            $table->dateTime('aprove_last_date')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inquiry_purchase_requests');
    }
};
