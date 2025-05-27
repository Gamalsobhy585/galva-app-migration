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
        Schema::create('employee_documentation', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('uuid', 36)->nullable();
            $table->integer('employee_id');
            $table->string('birth_certificate')->nullable();
            $table->string('military_service_certificate')->nullable();
            $table->string('criminal_chip')->nullable();
            $table->string('work_heel')->nullable();
            $table->string('identification_card_img')->nullable();
            $table->string('guild_carnet')->nullable();
            $table->string('personal_imgs')->nullable();
            $table->string('brent_insurance')->nullable();
            $table->string('corona_virus_vaccination_certificate')->nullable();
            $table->string('academic_qualification_certificate')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_documentation');
    }
};
