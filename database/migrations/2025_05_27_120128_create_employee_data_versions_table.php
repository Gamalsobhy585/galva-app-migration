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
        Schema::create('employee_data_versions', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->tinyInteger('organization_id')->nullable()->default(1);
            $table->integer('employee_id');
            $table->string('name_en');
            $table->string('name_ar');
            $table->tinyInteger('gender');
            $table->integer('marital_status');
            $table->integer('military_status')->nullable();
            $table->string('phone', 100)->nullable();
            $table->string('mobile', 100);
            $table->string('emergency_person_name');
            $table->string('emergency_person_relative');
            $table->string('emergency_person_phone');
            $table->text('address')->nullable();
            $table->string('national_id', 100);
            $table->integer('qualification_type');
            $table->integer('educational_department')->nullable();
            $table->year('graduation_year')->nullable();
            $table->integer('university')->nullable();
            $table->integer('educational_qualification')->nullable();
            $table->string('school')->nullable();
            $table->tinyInteger('status')->default(0);
            $table->string('not_updated_comment', 300)->nullable();
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable();
            $table->integer('updated_by')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_data_versions');
    }
};
