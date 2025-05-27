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
        Schema::create('employee_attendance_all', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('uuid', 36);
            $table->integer('employee_id')->nullable();
            $table->integer('employee_code');
            $table->date('date');
            $table->time('time')->nullable();
            $table->string('type', 300)->nullable()->default('C/In');
            $table->integer('location_id')->nullable();
            $table->integer('year')->nullable();
            $table->integer('created_by');
            $table->tinyInteger('transfered')->nullable()->default(0)->comment('0:no,1:transfered to in_ont table');
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_attendance_all');
    }
};
