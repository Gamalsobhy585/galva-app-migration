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
        Schema::create('job_competencies', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->tinyInteger('competency_type')->nullable()->comment('1:core, 2: managerial,3:functional');
            $table->string('competency_indicator_id', 50);
            $table->string('competency_rule', 300)->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('job_competencies');
    }
};
