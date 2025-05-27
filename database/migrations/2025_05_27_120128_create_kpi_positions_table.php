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
        Schema::create('kpi_positions', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('name_en', 250)->nullable();
            $table->string('name_ar', 250)->nullable();
            $table->string('equation', 250)->nullable();
            $table->tinyInteger('frequency')->nullable()->comment('0:annual, 1:quarterly');
            $table->tinyInteger('kpi_type_one')->nullable()->comment('0: strategic, 1: operational');
            $table->tinyInteger('kpi_type_two')->nullable()->comment('0: linear, 1: inverted');
            $table->bigInteger('department_id')->nullable()->default(38);
            $table->tinyInteger('is_same_with_department')->nullable()->comment('0: not checked, 1: checked');
            $table->string('kpi_department_related')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
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
        Schema::dropIfExists('kpi_positions');
    }
};
