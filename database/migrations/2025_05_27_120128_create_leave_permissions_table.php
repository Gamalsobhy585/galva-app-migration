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
        Schema::create('leave_permissions', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('organization_id');
            $table->integer('employee_id');
            $table->boolean('mission_request');
            $table->time('time')->nullable();
            $table->date('date')->nullable();
            $table->integer('num_hours')->nullable();
            $table->tinyInteger('permission_type')->nullable();
            $table->text('notes')->nullable();
            $table->integer('status')->comment('2=pending 1=approved 3=rejected 4=cancelled');
            $table->string('ref_id')->nullable();
            $table->integer('is_done')->nullable()->default(0)->comment('0: not done, 1: done');
            $table->string('reject_comment', 250)->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->integer('approve_by');
            $table->date('approve_date')->nullable();
            $table->integer('reject_by');
            $table->date('reject_date')->nullable();
            $table->integer('cancelled_by');
            $table->date('cancelled_date')->nullable();
            $table->text('mission_description')->nullable();
            $table->date('mission_date_from')->nullable();
            $table->date('mission_date_to')->nullable();
            $table->time('mission_time_from')->nullable();
            $table->time('mission_time_to')->nullable();
            $table->integer('location_site_id')->nullable();
            $table->integer('year')->nullable();
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('leave_permissions');
    }
};
