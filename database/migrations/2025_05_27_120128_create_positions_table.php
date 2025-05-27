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
        Schema::create('positions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36)->nullable();
            $table->integer('organization_id')->nullable()->default(1);
            $table->bigInteger('department_id');
            $table->tinyInteger('kpi_competency')->nullable()->default(0)->comment('0: Not kpi and competence ,1: has  competence and kpi ,2: has competence ONLY');
            $table->string('name_ar');
            $table->string('name_en');
            $table->string('position_title', 191)->nullable();
            $table->integer('expertise_type_id')->nullable();
            $table->integer('expertise_category_id')->nullable();
            $table->float('vacation_day_value', null, 0);
            $table->integer('vacation_approval')->nullable()->comment('0 means auto aprove, 1 means manager of employee will aprrove, 2 with two approve of his managers0 ');
            $table->string('business_unit')->nullable();
            $table->text('position_objective')->nullable();
            $table->text('key_accountabilities')->nullable();
            $table->text('education')->nullable();
            $table->text('computer_skills')->nullable();
            $table->text('professional_certification')->nullable();
            $table->text('language')->nullable();
            $table->text('experience')->nullable();
            $table->string('responsible_for')->nullable();
            $table->bigInteger('report_to')->nullable();
            $table->string('core_competency_id')->nullable();
            $table->string('managerial_competency_id')->nullable();
            $table->string('functional_competency_id')->nullable();
            $table->unsignedBigInteger('job_code_id')->nullable()->index('job_names_job_code_id_foreign');
            $table->integer('position_collar')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamps();
            $table->text('internal_relation')->nullable();
            $table->text('external_relation')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('positions');
    }
};
