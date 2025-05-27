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
        Schema::create('employee_vacations', function (Blueprint $table) {
            $table->increments('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->default(1);
            $table->unsignedInteger('employee_id')->nullable();
            $table->integer('created_by');
            $table->integer('deleted_by');
            $table->unsignedInteger('substitute_employee_id')->nullable();
            $table->unsignedInteger('vacation_type_id')->nullable();
            $table->date('date_from')->nullable();
            $table->date('date_to')->nullable();
            $table->float('num_days', null, 0)->unsigned()->nullable();
            $table->unsignedInteger('num_days_off')->nullable();
            $table->unsignedInteger('year')->nullable();
            $table->integer('is_done')->nullable()->default(0)->comment('0=> not done, 1=>done');
            $table->text('attaches')->nullable();
            $table->boolean('approval_steps')->unsigned()->nullable();
            $table->boolean('done')->unsigned()->nullable()->default(false);
            $table->string('ref_id')->nullable();
            $table->text('notes')->nullable();
            $table->boolean('approval1')->unsigned()->nullable()->default(false);
            $table->boolean('approval2')->unsigned()->nullable()->default(false);
            $table->unsignedInteger('approval1_by')->nullable();
            $table->dateTime('approval1_at')->nullable();
            $table->unsignedInteger('approval2_by')->nullable();
            $table->dateTime('approval2_at')->nullable();
            $table->text('reject_reason')->nullable();
            $table->unsignedInteger('num_days_canceled')->nullable();
            $table->string('canceled_date_selected')->nullable();
            $table->unsignedInteger('canceled_by')->nullable();
            $table->boolean('canceled_by_hr')->nullable()->default(false);
            $table->dateTime('canceled_at')->nullable();
            $table->integer('create_timestamp')->nullable();
            $table->integer('compensation_days_expired')->nullable();
            $table->unsignedInteger('reject_by')->nullable();
            $table->dateTime('reject_at')->nullable();
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
        Schema::dropIfExists('employee_vacations');
    }
};
