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
        Schema::create('payroll_monthly_attendance_report', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('calendar_id');
            $table->integer('month')->nullable();
            $table->integer('year')->nullable();
            $table->string('month_from')->nullable();
            $table->string('month_to')->nullable();
            $table->string('no_delays_total_count')->nullable();
            $table->string('delays_total_count')->nullable();
            $table->string('one_fp_total_count')->nullable();
            $table->string('absence_total_count')->nullable();
            $table->string('leave_no_pay_total_count')->nullable();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrentOnUpdate()->nullable()->useCurrent();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payroll_monthly_attendance_report');
    }
};
