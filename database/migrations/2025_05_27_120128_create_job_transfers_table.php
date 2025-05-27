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
        Schema::create('job_transfers', function (Blueprint $table) {
            $table->integer('id')->unique();
            $table->unsignedInteger('organization_id');
            $table->integer('structure_level_id');
            $table->integer('employee_id')->nullable();
            $table->integer('job_id')->nullable();
            $table->integer('head_manager_id')->nullable();
            $table->date('old_job_date')->nullable();
            $table->date('new_job_date')->nullable();
            $table->string('attachment')->nullable();
            $table->integer('created_by');
            $table->timestamps();
            $table->boolean('transfered')->default(false);

            $table->primary(['id', 'structure_level_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('job_transfers');
    }
};
