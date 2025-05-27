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
        Schema::create('temporary_employees', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('name_en');
            $table->string('name_ar');
            $table->string('code', 10);
            $table->tinyInteger('gender');
            $table->string('hiring_date', 150);
            $table->string('email');
            $table->string('marital_status');
            $table->string('temporary_employee_img')->nullable();
            $table->integer('national_id');
            $table->integer('nationality');
            $table->text('address');
            $table->integer('qualification_type');
            $table->integer('country');
            $table->string('birth_date');
            $table->integer('birth_location_id');
            $table->string('mobile');
            $table->string('emergency_person_name');
            $table->string('emergency_person_relative');
            $table->string('emergency_person_phone', 50);
            $table->bigInteger('educational_qualification')->nullable();
            $table->bigInteger('educational_department')->nullable();
            $table->bigInteger('university')->nullable();
            $table->year('graduation_year')->nullable();
            $table->string('school')->nullable();
            $table->integer('position_id');
            $table->integer('department_id');
            $table->integer('sub_department_id')->nullable();
            $table->integer('function_id')->nullable();
            $table->integer('project_id')->nullable();
            $table->integer('business_unit_id')->nullable();
            $table->integer('site_id');
            $table->integer('shift_id');
            $table->integer('organization_id');
            $table->bigInteger('manager_id')->nullable();
            $table->bigInteger('technical_manager_id')->nullable();
            $table->bigInteger('admin_manager_id')->nullable();
            $table->tinyInteger('active')->default(1);
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->integer('updated_by')->nullable();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('temporary_employees');
    }
};
