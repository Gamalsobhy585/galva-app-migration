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
        Schema::create('attendance_in_out', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('uuid', 36)->index('idx_attendance_uuid');
            $table->integer('employee_id')->nullable()->index('employee_id');
            $table->integer('employee_code')->index('employee_code');
            $table->integer('shift_id')->nullable()->index('idx_attendance_shift_id');
            $table->tinyInteger('is_main_shift')->nullable();
            $table->date('date')->index('date');
            $table->time('time_in')->nullable();
            $table->time('time_out')->nullable();
            $table->string('hours')->nullable();
            $table->integer('location_id')->nullable();
            $table->integer('year')->nullable();
            $table->boolean('delay')->default(false)->index('delay');
            $table->date('delay_change_at')->nullable();
            $table->integer('delay_change_by')->nullable();
            $table->text('delay_change_comment')->nullable();
            $table->time('delay_value')->nullable();
            $table->string('delaysDetails', 300)->nullable();
            $table->integer('validated')->default(0);
            $table->tinyInteger('status')->nullable()->default(4)->index('idx_attendance_status')->comment('0:pending, 1:approved,2:rejected,4:by Machine');
            $table->integer('action_by')->nullable();
            $table->integer('created_by');
            $table->timestamp('created_at')->useCurrent()->index('idx_attendance_created_at');
            $table->timestamp('updated_at')->useCurrentOnUpdate()->nullable();
            $table->integer('updated_by')->nullable();
            $table->softDeletes();
            $table->integer('deleted_by')->nullable();

            $table->index(['date'], 'date_2');
            $table->index(['employee_id'], 'employee_id_2');
            $table->index(['date'], 'idx_attendance_date');
            $table->index(['employee_code'], 'idx_attendance_employee_code');
            $table->index(['employee_id', 'date'], 'idx_attendance_employee_date');
            $table->index(['employee_id'], 'idx_attendance_employee_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('attendance_in_out');
    }
};
