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
        Schema::create('hiring_request_form', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->bigInteger('job_title_id');
            $table->bigInteger('department_id');
            $table->bigInteger('sub_department_id')->nullable();
            $table->integer('project_id')->nullable();
            $table->string('role', 191)->nullable();
            $table->string('job_type', 191)->nullable();
            $table->string('position_title', 191)->nullable();
            $table->bigInteger('report_to_employee_id')->nullable();
            $table->text('job_summary')->nullable();
            $table->text('education')->nullable();
            $table->string('experince', 191)->nullable();
            $table->string('working_hours', 191)->nullable();
            $table->string('days_off', 191)->nullable();
            $table->string('location', 191)->nullable();
            $table->string('compensation_range', 191)->nullable();
            $table->enum('employment_type', ['full_time', 'part_time'])->nullable();
            $table->text('reason_for_hiring')->nullable();
            $table->date('expecting_hiring_date')->nullable();
            $table->integer('number_of_employees')->nullable();
            $table->integer('first_approve_by')->nullable();
            $table->date('first_approve_date')->nullable();
            $table->integer('first_approve_status')->nullable();
            $table->integer('seconed_approve_by')->nullable();
            $table->date('seconed_approve_date')->nullable();
            $table->integer('seconed_approve_status')->nullable();
            $table->integer('third_approve_by')->nullable();
            $table->date('third_approve_date')->nullable();
            $table->integer('third_approve_status')->nullable();
            $table->integer('node_approve_status')->nullable()->default(0);
            $table->bigInteger('node_approved_by')->nullable();
            $table->timestamp('node_approved_at')->nullable();
            $table->integer('cancel_by')->nullable();
            $table->timestamp('cancel_at')->nullable();
            $table->integer('hold')->nullable()->default(0);
            $table->timestamp('hold_at')->nullable();
            $table->integer('unhold_or_hold_by')->nullable();
            $table->text('comment')->nullable();
            $table->integer('rejected_by')->nullable();
            $table->timestamp('rejected_at')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hiring_request_form');
    }
};
