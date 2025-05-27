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
        Schema::create('employee_pms_payroll_percentage_copy1', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->integer('revision')->nullable();
            $table->string('type', 200)->nullable();
            $table->bigInteger('year');
            $table->float('competency_percentage', null, 0)->nullable();
            $table->float('kpi_percentage', null, 0)->nullable();
            $table->float('percentage_of_increase_Below_60', null, 0)->nullable();
            $table->float('percentage_of_increase_From_61_to_70', null, 0)->nullable();
            $table->float('percentage_of_increase_From_71_to_80', null, 0)->nullable();
            $table->float('percentage_of_increase_From_81_to_95', null, 0)->nullable();
            $table->float('percentage_of_increase_more_than_96', null, 0)->nullable();
            $table->bigInteger('created_by');
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
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
        Schema::dropIfExists('employee_pms_payroll_percentage_copy1');
    }
};
