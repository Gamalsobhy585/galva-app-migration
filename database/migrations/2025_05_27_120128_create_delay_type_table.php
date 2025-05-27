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
        Schema::create('delay_type', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('delay');
            $table->string('name_en')->nullable();
            $table->string('name_ar')->nullable();
            $table->integer('color')->nullable();
            $table->string('type')->nullable();
            $table->string('type_name_en')->nullable();
            $table->string('type_name_ar')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('delay_type');
    }
};
