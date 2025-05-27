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
        Schema::create('kpi_departments', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('name_en')->nullable();
            $table->string('name_ar')->nullable();
            $table->text('equation')->nullable();
            $table->bigInteger('department_id')->nullable();
            $table->tinyInteger('frequency')->nullable()->comment('0: annual, 1: quarterly');
            $table->text('equition')->nullable();
            $table->bigInteger('objective_id')->nullable();
            $table->string('code')->nullable();
            $table->tinyInteger('kpi_type_one')->nullable()->comment('0: strategic, 1: operational');
            $table->tinyInteger('kpi_type_two')->nullable()->comment('0: linear, 1: inverted');
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
        Schema::dropIfExists('kpi_departments');
    }
};
