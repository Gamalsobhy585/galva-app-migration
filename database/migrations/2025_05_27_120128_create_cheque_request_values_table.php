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
        Schema::create('cheque_request_values', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('cheque_id');
            $table->string('cheque_value');
            $table->string('used_value');
            $table->string('value_letter');
            $table->string('type_cheque', 200);
            $table->date('due_date')->nullable();
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
        Schema::dropIfExists('cheque_request_values');
    }
};
