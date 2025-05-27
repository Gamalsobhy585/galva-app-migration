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
        Schema::create('crm_registerations_details', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('subject', 191)->nullable();
            $table->string('by_who', 191)->nullable();
            $table->string('date', 191)->nullable();
            $table->integer('registeration_id')->nullable();
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
        Schema::dropIfExists('crm_registerations_details');
    }
};
