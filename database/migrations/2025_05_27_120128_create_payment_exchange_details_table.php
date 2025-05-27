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
        Schema::create('payment_exchange_details', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->char('uuid', 20);
            $table->string('project_id', 200)->nullable();
            $table->string('purchase_order_id', 200)->nullable();
            $table->bigInteger('payment_id');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_exchange_details');
    }
};
