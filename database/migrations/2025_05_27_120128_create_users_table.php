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
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id')->unique('id')->autoincrement();
            $table->char('uuid', 36)->unique('uuid');
            $table->integer('position_type')->nullable()->default(1);
            $table->integer('organization_id')->nullable()->default(1);
            $table->integer('employee_id');
            $table->string('name')->nullable();
            $table->string('name_ar');
            $table->string('name_en');
            $table->string('username');
            $table->string('email')->nullable();
            $table->string('email_2')->nullable();
            $table->string('business_email')->nullable();
            $table->string('code', 10)->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->default('$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6');
            $table->string('api_token', 80)->nullable()->unique();
            $table->bigInteger('technical_manager_id')->nullable();
            $table->unsignedBigInteger('manager_id')->nullable();
            $table->unsignedBigInteger('department_id')->nullable();
            $table->unsignedBigInteger('sub_department_id')->nullable();
            $table->unsignedBigInteger('project_id')->nullable();
            $table->unsignedBigInteger('job_name_id')->nullable();
            $table->unsignedBigInteger('job_grade_id')->nullable();
            $table->string('position_ar')->nullable();
            $table->string('position_en')->nullable();
            $table->boolean('active')->default(true);
            $table->string('profile')->nullable();
            $table->boolean('board_member')->default(false);
            $table->rememberToken();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamps();
            $table->boolean('delegated_at')->default(false);
            $table->boolean('user_type_id')->nullable()->default(false);
            $table->boolean('can_be_impersonated')->nullable()->default(true);
            $table->boolean('is_interviewer')->default(false);
            $table->tinyInteger('business_unit_id')->nullable();
            $table->enum('lang_perfer', ['ar', 'en'])->nullable();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
