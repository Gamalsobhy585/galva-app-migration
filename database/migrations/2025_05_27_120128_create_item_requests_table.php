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
        Schema::create('item_requests', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('purchase_request_id')->index('item_requests_purchase_request_id_foreign');
            $table->unsignedBigInteger('family_name_id')->index('item_requests_family_name_id_foreign');
            $table->text('specification');
            $table->string('file')->nullable();
            $table->string('comment_reason')->nullable();
            $table->float('quantity', null, 0);
            $table->float('stock_quantity', null, 0);
            $table->float('actual_quantity', null, 0);
            $table->float('used_quantity', null, 0);
            $table->string('comment_refuse')->nullable();
            $table->unsignedBigInteger('unit_id')->index('item_requests_unit_id_foreign');
            $table->enum('priority', ['L', 'M', 'H'])->comment('L: Low, M: Medium, H: High');
            $table->text('factory_specification')->nullable();
            $table->float('reserved_quantity', null, 0)->nullable();
            $table->date('max_date_delivery')->nullable();
            $table->date('start_date_supply')->nullable();
            $table->text('comment')->nullable();
            $table->boolean('approved')->default(true);
            $table->text('edit_specification')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->unsignedBigInteger('action_comment_id')->nullable()->index('item_requests_action_comment_id_foreign');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('item_requests');
    }
};
