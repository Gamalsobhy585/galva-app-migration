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
        Schema::create('employee_exit_interview_details', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('employee_exit_interview_id');
            $table->string('option_name');
            $table->string('value');
            $table->integer('created_by');
            $table->timestamps();
            $table->softDeletes();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_exit_interview_details');
    }
};
