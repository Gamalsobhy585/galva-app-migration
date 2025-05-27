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
        Schema::create('employee_exit', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->char('uuid', 36);
            $table->bigInteger('employee_id');
            $table->integer('exit_type')->comment('0: resignation,1: termination,2: death,3: out of work');
            $table->date('last_work_date_resigned')->nullable();
            $table->string('resignation_letter', 300)->nullable();
            $table->string('form_6_resigned', 300)->nullable();
            $table->date('request_exit_date')->nullable();
            $table->string('form_6_terminated', 300)->nullable();
            $table->date('last_work_date_terminated')->nullable();
            $table->date('date_of_death')->nullable();
            $table->string('death_certificate', 300)->nullable();
            $table->string('inheritance_information', 300)->nullable();
            $table->date('out_of_work_from_date')->nullable();
            $table->text('out_of_work_notes')->nullable();
            $table->bigInteger('created_by');
            $table->integer('status')->nullable()->default(0);
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
        Schema::dropIfExists('employee_exit');
    }
};
