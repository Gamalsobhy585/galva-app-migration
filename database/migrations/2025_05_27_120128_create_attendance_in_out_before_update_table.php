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
        Schema::create('attendance_in_out_before_update', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('uuid', 36);
            $table->integer('employee_id')->nullable();
            $table->integer('employee_code');
            $table->date('date');
            $table->time('time_in')->nullable();
            $table->time('time_out')->nullable();
            $table->string('hours')->nullable();
            $table->integer('location_id')->nullable();
            $table->boolean('delay')->default(false);
            $table->time('delay_value')->nullable();
            $table->string('delaysDetails', 300)->nullable();
            $table->integer('validated')->default(0);
            $table->tinyInteger('status')->nullable()->default(4)->comment('0:pending, 1:approved,2:rejected,4:by Machine');
            $table->integer('action_by')->nullable();
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->integer('updated_by')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('attendance_in_out_before_update');
    }
};
