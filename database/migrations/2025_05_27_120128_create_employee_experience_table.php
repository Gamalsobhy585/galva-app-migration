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
        Schema::create('employee_experience', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->bigInteger('employee_id');
            $table->string('experience_company_name', 300)->nullable();
            $table->string('experience_job_title', 300)->nullable();
            $table->date('experience_date_to')->nullable();
            $table->date('experience_date_from')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_experience');
    }
};
