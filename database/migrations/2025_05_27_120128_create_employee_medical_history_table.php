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
        Schema::create('employee_medical_history', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('employee_id');
            $table->string('health_ensurance_number');
            $table->date('health_ensurance_date_end');
            $table->date('health_ensurance_date')->nullable();
            $table->string('annual_amount');
            $table->string('monthly_amount');
            $table->boolean('medical_level')->nullable();
            $table->string('medical_company');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_medical_history');
    }
};
