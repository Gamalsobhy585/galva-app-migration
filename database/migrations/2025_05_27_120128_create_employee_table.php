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
        Schema::create('employee', function (Blueprint $table) {
            $table->bigIncrements('id')->index('id_index');
            $table->char('uuid', 36)->index('idx_employee_uuid');
            $table->integer('organization_id')->nullable()->default(1)->index('idx_employee_org_id');
            $table->string('name_en')->nullable();
            $table->integer('code');
            $table->tinyInteger('religion')->default(0);
            $table->integer('not_uploaded_at_first')->nullable()->default(0);
            $table->integer('user_id')->nullable()->index('idx_employee_user_id');
            $table->bigInteger('function_id')->nullable();
            $table->unsignedBigInteger('department_id')->nullable();
            $table->bigInteger('sub_department_id')->nullable();
            $table->unsignedBigInteger('project_id')->nullable();
            $table->unsignedBigInteger('position_id')->nullable()->index('position_id');
            $table->bigInteger('group_id')->nullable();
            $table->bigInteger('job_group_id')->nullable();
            $table->bigInteger('shift_id')->nullable()->index('shift_id');
            $table->bigInteger('count_null_hr');
            $table->bigInteger('count_not_null_hr');
            $table->bigInteger('count_null_personal')->nullable();
            $table->bigInteger('count_not_null_personal')->nullable();
            $table->string('name_ar')->nullable();
            $table->string('preferable_name')->nullable();
            $table->string('employee_img')->nullable();
            $table->date('hiring_date')->nullable();
            $table->text('application_form')->nullable();
            $table->text('package_form')->nullable();
            $table->text('assessment_form')->nullable();
            $table->string('username')->nullable();
            $table->string('email')->nullable()->index('idx_employee_email');
            $table->string('business_email')->nullable();
            $table->string('collar', 300);
            $table->boolean('is_interviewer')->nullable()->comment('1 => yes , 2 => no');
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->default('$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6');
            $table->unsignedBigInteger('manager_id')->nullable();
            $table->bigInteger('technical_manager_id')->nullable();
            $table->bigInteger('evaluation_manager_id')->nullable();
            $table->unsignedBigInteger('sector_id')->nullable();
            $table->bigInteger('site_id')->nullable();
            $table->unsignedBigInteger('job_level_id')->nullable();
            $table->tinyInteger('job_group_type')->nullable();
            $table->boolean('position_type')->nullable();
            $table->boolean('active')->default(false)->comment('0 = active || 1 = not active');
            $table->tinyInteger('is_exit')->default(0)->comment('0: not exit, 1: exit');
            $table->tinyInteger('is_interview')->default(0)->comment('0: not interviewed exit, 1: exit interview');
            $table->tinyInteger('is_out_of_work')->nullable()->default(0);
            $table->string('profile')->nullable();
            $table->boolean('board_member')->default(false);
            $table->rememberToken();
            $table->boolean('delegated_at')->default(false);
            $table->boolean('user_type_id')->nullable()->default(false);
            $table->tinyInteger('gender')->nullable();
            $table->string('marital_status')->nullable();
            $table->string('military_status')->nullable();
            $table->string('national_id', 100)->nullable()->index('idx_employee_national_id');
            $table->integer('nationality')->nullable();
            $table->text('address')->nullable();
            $table->text('facebook_link')->nullable();
            $table->tinyInteger('qualification_type')->comment('1: master_degree, 2:hire, 3:middle, 4:lower, 5:no_qualification');
            $table->integer('country')->nullable();
            $table->bigInteger('educational_department')->nullable();
            $table->bigInteger('educational_qualification')->nullable();
            $table->bigInteger('university')->nullable();
            $table->year('graduation_year')->nullable();
            $table->string('school', 250)->nullable();
            $table->integer('insurance_number')->nullable();
            $table->string('insurance_amount')->nullable();
            $table->string('perivous_insurance_amount')->nullable();
            $table->string('insurance_out_date')->nullable();
            $table->string('insurance_authority')->nullable();
            $table->string('insurance_start_date')->nullable();
            $table->string('birth_date')->nullable();
            $table->integer('birth_location_id')->nullable();
            $table->boolean('hiring_status')->default(false)->index('idx_employee_hiring_status')->comment('0=> still worked / 1=>hold / 2=> deactivated');
            $table->integer('structure_level_id')->nullable();
            $table->integer('job_title_id')->nullable();
            $table->string('emergency_person_name')->nullable();
            $table->string('emergency_person_relative')->nullable();
            $table->string('emergency_person_phone', 50)->nullable();
            $table->string('phone')->nullable();
            $table->string('mobile')->nullable()->index('idx_employee_mobile');
            $table->string('official_email')->nullable();
            $table->integer('hiring_status_id')->nullable();
            $table->string('hire_date', 100)->nullable();
            $table->string('job_in_insurance', 500)->nullable();
            $table->string('medical')->nullable();
            $table->integer('medical_level')->nullable()->comment('1: level one, 2:level two,3:level three,4:level four');
            $table->tinyInteger('current_employed')->nullable();
            $table->integer('health_insurance_number')->nullable();
            $table->date('health_insurance_date')->nullable();
            $table->date('health_insurance_date_end')->nullable();
            $table->string('annual_amount');
            $table->string('monthly_amount')->nullable();
            $table->string('medical_card')->nullable();
            $table->tinyInteger('id_card_type')->nullable()->comment('1:Magnetic,2:plastic,3:none');
            $table->float('cost', null, 0)->nullable();
            $table->string('delivery_date')->nullable();
            $table->tinyInteger('handle_after_leaving')->nullable()->comment('1:yes,2:no');
            $table->integer('work_stub_number')->nullable();
            $table->string('qualification', 500)->nullable();
            $table->string('qualification_department', 400)->nullable();
            $table->string('job_offer_number', 150)->nullable();
            $table->string('upload_cv')->nullable();
            $table->string('current_work_location')->nullable();
            $table->integer('business_unit_id')->nullable();
            $table->string('job_function_id')->nullable();
            $table->string('insurance_department')->nullable();
            $table->string('beginning_insurance')->nullable();
            $table->string('previous_insurance')->nullable();
            $table->string('number_of_insurance')->nullable();
            $table->string('change_job_insurance')->nullable();
            $table->string('date_of_job_change')->nullable();
            $table->double('salary_total_amount', null, 0)->nullable();
            $table->integer('bank_account_number')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('bank_branch')->nullable();
            $table->string('bank_currency')->nullable();
            $table->integer('passport_number')->nullable();
            $table->date('expiry_date')->nullable();
            $table->double('salary_net_amount', null, 0)->nullable();
            $table->integer('exit_type')->nullable()->comment('0->resignitation,1->termination,2->death, 3->out of work');
            $table->timestamps();
            $table->softDeletes();
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->bigInteger('admin_manager_id')->nullable();
            $table->string('countNOTNull')->nullable();
            $table->string('countNull')->nullable();
            $table->boolean('payroll_active')->nullable()->default(false)->index('payroll_active');
            $table->integer('Payroll_admin_id')->nullable()->index('payroll_admin_id');
            $table->boolean('fingerprint_exemption')->default(false);
            $table->tinyInteger('exception_rule')->default(0);
            $table->boolean('disability')->default(false)->comment('0 == no | 1 == yes');
            $table->text('resignation_letter')->nullable();
            $table->text('form_6')->nullable();
            $table->date('last_work_date')->nullable();
            $table->date('date_of_death')->nullable();
            $table->integer('expertise_type_id')->nullable();
            $table->tinyInteger('employment_type')->default(0);
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->string('passport_no', 100)->nullable();
            $table->tinyInteger('has_site_kpi')->nullable();

            $table->index(['active', 'is_exit'], 'idx_employee_active_exit');
            $table->index(['department_id', 'shift_id'], 'idx_employee_department_shift');
            $table->index(['manager_id', 'technical_manager_id', 'evaluation_manager_id'], 'idx_employee_managers');
            $table->primary(['id', 'uuid']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee');
    }
};
