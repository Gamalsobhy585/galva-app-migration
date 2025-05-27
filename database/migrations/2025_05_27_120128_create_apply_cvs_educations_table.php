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
        Schema::create('apply_cvs_educations', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('faculty', 191)->nullable();
            $table->string('university', 191)->nullable();
            $table->date('date_from_faculty')->nullable();
            $table->date('date_to_faculty')->nullable();
            $table->string('school', 191)->nullable();
            $table->date('date_from_school')->nullable();
            $table->date('date_to_school')->nullable();
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
        Schema::dropIfExists('apply_cvs_educations');
    }
};
