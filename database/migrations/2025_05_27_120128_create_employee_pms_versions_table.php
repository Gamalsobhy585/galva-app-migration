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
        Schema::create('employee_pms_versions', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('emp_pms_id');
            $table->bigInteger('revision');
            $table->integer('kpi_percentage')->nullable();
            $table->integer('competency_percentage')->nullable();
            $table->float('final_score', null, 0)->nullable();
            $table->char('year', 20);
            $table->string('month', 50)->nullable();
            $table->double('percentage_of_increase', null, 0)->nullable();
            $table->string('type', 300)->nullable();
            $table->bigInteger('created_by');
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
        Schema::dropIfExists('employee_pms_versions');
    }
};
