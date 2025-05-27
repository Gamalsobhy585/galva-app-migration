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
        Schema::create('hr_request_details', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('hr_request_id');
            $table->string('record_name', 191);
            $table->string('name', 191);
            $table->integer('action')->nullable()->default(0);
            $table->string('note')->nullable();
            $table->integer('action_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hr_request_details');
    }
};
