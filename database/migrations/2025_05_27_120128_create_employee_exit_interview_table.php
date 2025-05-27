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
        Schema::create('employee_exit_interview', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('employee_id');
            $table->integer('induct');
            $table->text('no_induct_reason')->nullable();
            $table->bigInteger('supervision_type_id')->nullable();
            $table->bigInteger('leaving_reason')->nullable();
            $table->text('main_reason')->nullable();
            $table->text('most_satisfying')->nullable();
            $table->text('most_stressful')->nullable();
            $table->text('any_policies')->nullable();
            $table->text('return_to_company')->nullable();
            $table->text('recommend_friend')->nullable();
            $table->text('keep_in_business')->nullable();
            $table->text('employee_comment')->nullable();
            $table->text('interviewer_comment')->nullable();
            $table->text('interviewer_signature')->nullable();
            $table->string('employee_signature')->nullable();
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable();
            $table->integer('updated_by');
            $table->timestamp('updated_at')->nullable();
            $table->integer('deleted_by');
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_exit_interview');
    }
};
