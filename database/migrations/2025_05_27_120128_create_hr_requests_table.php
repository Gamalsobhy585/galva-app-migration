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
        Schema::create('hr_requests', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('employee_id')->nullable();
            $table->string('ref_id')->nullable();
            $table->integer('organization_id');
            $table->integer('hr_request_type')->comment('1: it_forms ---> it_change_request, 2: it_forms ---> exception_permission, 3: general_forms--->hr_letter, 4: general_forms--->medical_insurance, 5: general_forms--->request_change_user_profile_data');
            $table->string('services')->nullable()->comment('[1:network_access,2:internet_access,3:email_account,4:other_services]');
            $table->string('equipment')->nullable()->comment('[1:laptop,2:desktop_computer,3:computer_monitor,4:computer_keyboard,5:computer_mouse,6:external_hard_disk,7:usb_flash_drive,8:memory_card,9:multi_outlet,10:A4_mono_laser_printer(black & white),11:A4 colour printer,12:A3 mono laser printer(black&white),13:a3 colour printer, 14:printer ink cartridges,15:computer_scanner,16:other_equipment]');
            $table->text('notes')->nullable();
            $table->text('other_services')->nullable();
            $table->text('other_equipment')->nullable();
            $table->string('date_from')->nullable();
            $table->string('date_to')->nullable();
            $table->integer('equipement_type')->nullable()->comment('[1:laptop,2:desktop_computer,3:computer_monitor,4:computer_keyboard,5:computer_mouse,6:external_hard_disk,7:usb_flash_drive,8:memory_card,9:multi_outlet,10:A4_mono_laser_printer(black & white),11:A4 colour printer,12:A3 mono laser printer(black&white),13:a3 colour printer, 14:printer ink cartridges,15:computer_scanner,16:other_type]');
            $table->string('manufacturer')->nullable();
            $table->string('model')->nullable();
            $table->string('serial_number')->nullable();
            $table->string('other_type')->nullable();
            $table->text('reason')->nullable();
            $table->boolean('hr_lang')->nullable()->comment('1: arabic, 2: english');
            $table->text('hr_to')->nullable();
            $table->boolean('hr_salary')->nullable()->comment('1:required,2:not required');
            $table->text('hr_info')->nullable();
            $table->boolean('vacation_type')->nullable();
            $table->date('vacation_date')->nullable();
            $table->text('vacation_info')->nullable();
            $table->text('medical_info')->nullable();
            $table->text('social_info')->nullable();
            $table->text('bank_info')->nullable();
            $table->date('finger_date')->nullable();
            $table->text('finger_info')->nullable();
            $table->date('pantry_date')->nullable();
            $table->text('pantry_info')->nullable();
            $table->boolean('emp_docs_type')->nullable();
            $table->text('emp_docs_reason')->nullable();
            $table->date('emp_docs_expect_date')->nullable();
            $table->integer('created_by');
            $table->timestamps();
            $table->boolean('done')->default(false)->comment('0: default pending, 1: done');
            $table->string('action_by')->nullable();
            $table->string('action_at')->nullable();
            $table->tinyInteger('it_status')->nullable()->default(0)->comment('0: not proccess yet, 1:completed, 2:esclate,3:revert');
            $table->string('reject_comment')->nullable();
            $table->string('esclate_comment')->nullable();
            $table->string('revert_comment')->nullable();
            $table->string('recommend_vacancy_name')->nullable();
            $table->string('recommend_vacancy_phone', 30)->nullable();
            $table->text('recommend_vacancy_education')->nullable();
            $table->string('recommend_vacancy_email')->nullable();
            $table->text('recommend_vacancy_cv')->nullable();
            $table->text('recommend_vacancy_notes')->nullable();
            $table->string('referral_bounce_name')->nullable();
            $table->text('referral_bounce_notes')->nullable();
            $table->softDeletes();
            $table->integer('deleted_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->tinyInteger('medical_program')->nullable()->comment('1:program one, 2: program two, 3: program three, 4: program four');
            $table->integer('medical_for_id')->nullable()->comment('0: my_self, 1: wife, 2: son or daughter, 3: other_employee, 4: galva');
            $table->string('full_name', 300)->nullable();
            $table->string('birth_date', 300)->nullable();
            $table->string('mobile', 300)->nullable();
            $table->bigInteger('national_id')->nullable();
            $table->string('personnel_image', 300)->nullable();
            $table->text('medical_notes')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hr_requests');
    }
};
