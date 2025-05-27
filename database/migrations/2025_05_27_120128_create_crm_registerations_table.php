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
        Schema::create('crm_registerations', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('register_name', 400);
            $table->string('date', 191)->nullable();
            $table->text('notes')->nullable();
            $table->string('from_who', 191)->nullable();
            $table->string('registeration_number', 191)->nullable();
            $table->text('attachments')->nullable();
            $table->enum('status', ['waiting', 'approved', 'cancelled'])->default('waiting');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_registerations');
    }
};
