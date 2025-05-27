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
        Schema::create('employee_rejection_pms_histories', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->float('kpi_score', null, 0)->nullable();
            $table->integer('pms_id');
            $table->float('competence_score', null, 0);
            $table->float('final_score', null, 0);
            $table->string('reject_comment')->nullable();
            $table->timestamp('reject_date')->nullable();
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->tinyInteger('status')->comment('1 Approved -- 0 Rejected');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_rejection_pms_histories');
    }
};
