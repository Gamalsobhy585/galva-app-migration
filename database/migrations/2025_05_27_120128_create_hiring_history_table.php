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
        Schema::create('hiring_history', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('organization_id');
            $table->unsignedInteger('employee_id')->nullable();
            $table->integer('job_title_id')->nullable();
            $table->integer('structure_level_id');
            $table->integer('head_manager_id')->nullable();
            $table->string('status', 100)->nullable()->comment('activate, deactivate, leave_job, assign_to_job');
            $table->unsignedInteger('created_by')->nullable();
            $table->dateTime('created_at');
            $table->dateTime('updated_at');
            $table->integer('create_timestamp')->nullable();
            $table->dateTime('transaction_date')->nullable();
            $table->string('attachment')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hiring_history');
    }
};
