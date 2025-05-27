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
        Schema::create('employee_of_the_month', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('ref_id')->nullable();
            $table->integer('employee_id');
            $table->integer('year');
            $table->integer('month');
            $table->tinyInteger('reason');
            $table->text('what_did_they_do');
            $table->text('evidence');
            $table->string('attachments')->nullable();
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('publish')->nullable();
            $table->text('other_reason')->nullable();
            $table->integer('approve_by_first')->nullable();
            $table->integer('approve_by_second')->nullable();
            $table->integer('approve_by_third')->nullable();
            $table->integer('approve_by_forth')->nullable();
            $table->integer('approve_by_fifth')->nullable();
            $table->integer('approve_by_sixth')->nullable();
            $table->integer('last_approve')->nullable();
            $table->string('hr_comment')->nullable();
            $table->tinyInteger('exception')->nullable();
            $table->integer('created_by');
            $table->integer('rejected_by')->nullable();
            $table->timestamps();
            $table->integer('updated_by')->nullable();
            $table->softDeletes();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_of_the_month');
    }
};
