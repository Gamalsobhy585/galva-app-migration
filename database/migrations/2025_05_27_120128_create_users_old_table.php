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
        Schema::create('users-old', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->boolean('employee_id')->nullable()->default(false);
            $table->string('name_ar');
            $table->string('name_en');
            $table->string('username');
            $table->string('email');
            $table->string('code', 10)->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->default('$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6');
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
            $table->boolean('is_interviewer')->nullable()->default(false);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users-old');
    }
};
