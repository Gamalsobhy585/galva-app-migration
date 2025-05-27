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
        Schema::create('employee_pms_career_plannings', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('pms_id');
            $table->text('short_term')->nullable();
            $table->text('long_term')->nullable();
            $table->text('improvement_area')->nullable();
            $table->text('action_improvement')->nullable();
            $table->text('employee_comment')->nullable();
            $table->text('manager_comment')->nullable();
            $table->text('training')->nullable();
            $table->text('institute_source')->nullable();
            $table->text('preferred_date')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_pms_career_plannings');
    }
};
