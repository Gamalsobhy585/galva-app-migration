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
        Schema::create('apply_cvs', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->date('date');
            $table->string('first_name', 191)->nullable();
            $table->string('middle_name', 191)->nullable();
            $table->string('family_name', 191)->nullable();
            $table->string('nationality', 191)->nullable();
            $table->date('birthday')->nullable();
            $table->string('address')->nullable();
            $table->string('mobile_number', 191)->nullable();
            $table->string('email', 191)->nullable();
            $table->enum('gender', ['male', 'female'])->nullable();
            $table->enum('marital_status', ['single', 'married', 'divorced', 'widowed'])->nullable();
            $table->enum('military_status', ['complete', 'exemption', 'postponed'])->nullable();
            $table->string('position', 191)->nullable();
            $table->date('date_can_start');
            $table->enum('type_employment', ['fulltime', 'parttime'])->nullable();
            $table->text('personal_skills')->nullable();
            $table->text('computer_skills')->nullable();
            $table->enum('lang_skill_arabic', ['exc', 'good', 'fair'])->nullable();
            $table->enum('lang_skill_english', ['exc', 'good', 'fair'])->nullable();
            $table->enum('other', ['exc', 'good', 'fair'])->nullable();
            $table->string('school', 191)->nullable();
            $table->date('date_from_school')->nullable();
            $table->date('date_to_school')->nullable();
            $table->string('reason_leaving', 191)->nullable();
            $table->string('expect_salary', 191)->nullable();
            $table->string('company_advantage', 191)->nullable();
            $table->text('attachment')->nullable();
            $table->enum('work_in_company_before', ['yes', 'no'])->nullable();
            $table->string('work_in_company_before_name', 191)->nullable();
            $table->string('work_in_company_before_location', 191)->nullable();
            $table->enum('have_family_in', ['yes', 'no'])->nullable();
            $table->string('have_family_in_name', 191)->nullable();
            $table->string('have_family_in_location', 191)->nullable();
            $table->enum('have_legal_problem', ['yes', 'no'])->nullable();
            $table->text('have_legal_problem_desc')->nullable();
            $table->enum('have_diseases', ['yes', 'no'])->nullable();
            $table->text('have_diseases_desc')->nullable();
            $table->enum('have_political_party', ['yes', 'no'])->nullable();
            $table->text('have_political_party_desc')->nullable();
            $table->enum('have_current_insurance', ['yes', 'no'])->nullable();
            $table->text('have_current_insurance_desc')->nullable();
            $table->enum('have_problem_insurance', ['yes', 'no'])->nullable();
            $table->text('have_problem_insurance_desc')->nullable();
            $table->enum('smoked', ['yes', 'no'])->nullable();
            $table->text('do_you_have_other_info')->nullable();
            $table->string('applicant_acknowledgement_name', 191)->nullable();
            $table->string('applicant_acknowledgement_sign', 191)->nullable();
            $table->date('applicant_acknowledgement_date')->nullable();
            $table->tinyInteger('save_as_applicant')->default(0);
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->text('cv_content');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('apply_cvs');
    }
};
