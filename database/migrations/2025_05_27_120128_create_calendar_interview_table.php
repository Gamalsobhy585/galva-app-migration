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
        Schema::create('calendar_interview', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('organization_id')->nullable();
            $table->integer('applicant_id')->nullable();
            $table->integer('department_id');
            $table->integer('structure_level_id');
            $table->date('date')->nullable();
            $table->time('time')->nullable();
            $table->unsignedInteger('job_id')->nullable();
            $table->unsignedInteger('recommended_job_level_id');
            $table->integer('recommended_job_id');
            $table->unsignedInteger('interviewer_id')->nullable()->comment('employee_id');
            $table->string('attachment')->nullable();
            $table->text('notes')->nullable();
            $table->integer('contact_phone_id')->nullable();
            $table->integer('hire_source_id')->nullable();
            $table->unsignedTinyInteger('is_attended')->nullable()->default(2)->comment('1: attend, 3: not attend, 2: not yet');
            $table->unsignedInteger('not_attended_reason_id')->nullable();
            $table->text('not_attended_notes')->nullable();
            $table->unsignedTinyInteger('is_accepted')->nullable()->default(2)->comment('1: accepted, 3: not accpeted, 2: not yet');
            $table->unsignedInteger('rejected_reason_id')->nullable();
            $table->text('rejected_notes')->nullable();
            $table->unsignedInteger('created_by')->nullable();
            $table->integer('recommended_by')->nullable();
            $table->integer('parent_id');
            $table->integer('type')->default(0)->comment('0==normal interview 1==scheduled interview');
            $table->timestamp('created_at')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->softDeletes();
            $table->timestamp('updated_at')->nullable();
            $table->integer('create_timestamp')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('calendar_interview');
    }
};
