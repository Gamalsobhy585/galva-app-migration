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
        Schema::create('apply_cvs_experiences', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->date('experience_date_from')->nullable();
            $table->date('experience_date_to')->nullable();
            $table->string('experience_job_title', 191)->nullable();
            $table->string('experience_company_name', 191)->nullable();
            $table->integer('apply_cv_id')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('apply_cvs_experiences');
    }
};
