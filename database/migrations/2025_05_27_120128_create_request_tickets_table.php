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
        Schema::create('request_tickets', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('code');
            $table->string('subject', 300);
            $table->text('description')->nullable();
            $table->string('files', 500)->nullable();
            $table->integer('priority_type')->default(0)->comment('Not Specified yet: 0, High Priority: 1, Medium Priority: 2, Low Priority: 3');
            $table->integer('status')->default(0)->comment('0:BackLog, 1:InProgress, 2:Done, 3:Cancelled');
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
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
        Schema::dropIfExists('request_tickets');
    }
};
