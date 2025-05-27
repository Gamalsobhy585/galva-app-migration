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
        Schema::create('exception_leave_permissions', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('organization_id')->default(1);
            $table->boolean('leave_permission_type');
            $table->integer('site_id');
            $table->string('other_location', 300)->nullable();
            $table->integer('shift_id')->nullable();
            $table->string('employee_id', 300)->nullable();
            $table->string('name', 50);
            $table->date('exception_date')->nullable();
            $table->time('exception_time')->nullable();
            $table->integer('exception_num_hours')->nullable();
            $table->integer('status')->default(1)->comment('2=pending 1=approved 3=rejected 4=cancelled');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exception_leave_permissions');
    }
};
