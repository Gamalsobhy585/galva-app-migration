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
        Schema::create('employee_pms_old-2', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->char('uuid', 36);
            $table->bigInteger('position_id');
            $table->bigInteger('employee_id');
            $table->bigInteger('system_setting_id')->nullable();
            $table->bigInteger('created_by');
            $table->bigInteger('accepted_by')->nullable();
            $table->bigInteger('not_accepted_by')->nullable();
            $table->tinyInteger('status')->nullable()->default(0);
            $table->string('ref_id')->nullable();
            $table->string('not_accept_comment')->nullable();
            $table->string('reject_comment')->nullable();
            $table->float('kpi_score', null, 0)->nullable();
            $table->float('kpi_weight_score', null, 0)->nullable();
            $table->float('competence_score', null, 0)->nullable();
            $table->float('final_score', null, 0)->nullable();
            $table->string('manager_signature')->nullable();
            $table->string('employee_signature')->nullable();
            $table->timestamp('date_employee_signature')->nullable();
            $table->timestamp('date_manager_signature')->nullable();
            $table->char('status_employee', 36)->nullable();
            $table->tinyInteger('final_submit')->nullable()->default(0)->comment('0: pending, 1: final submit');
            $table->float('total_target', null, 0)->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_pms_old-2');
    }
};
