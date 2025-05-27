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
        Schema::create('employee_course', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('uuid', 36);
            $table->string('course_name', 211);
            $table->date('course_start_date')->nullable();
            $table->date('course_end_date')->nullable();
            $table->string('course_location', 211)->nullable();
            $table->integer('employee_id');
            $table->timestamps();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_course');
    }
};
