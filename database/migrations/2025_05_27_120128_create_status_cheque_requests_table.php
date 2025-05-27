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
        Schema::create('status_cheque_requests', function (Blueprint $table) {
            $table->bigInteger('cheque_request_id');
            $table->text('comment_deactivate')->nullable();
            $table->text('comment_activate')->nullable();
            $table->string('file_deactivate')->nullable();
            $table->string('file_deactivate_name')->nullable();
            $table->string('file_activate')->nullable();
            $table->string('file_activate_name')->nullable();
            $table->bigInteger('deactivate_by')->nullable();
            $table->bigInteger('activate_by')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('status_cheque_requests');
    }
};
