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
        Schema::create('cheque_request_statements', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->integer('statement_type');
            $table->bigInteger('purchase_order_id')->nullable();
            $table->string('debit_value');
            $table->bigInteger('cheque_id');
            $table->text('notes')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cheque_request_statements');
    }
};
