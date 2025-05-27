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
        Schema::create('employee_training', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->bigInteger('employee_id');
            $table->tinyInteger('type')->nullable()->default(0)->comment('0: EEC TRAINING, 1:  without EEC TRAINIBG');
            $table->string('training_name', 250)->nullable();
            $table->string('training_date_from', 150)->nullable();
            $table->string('training_date_to', 150)->nullable();
            $table->string('training_commitment_end_date', 150)->nullable();
            $table->bigInteger('training_course_fees')->nullable();
            $table->string('training_center_name')->nullable();
            $table->string('training_file')->nullable();
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
        Schema::dropIfExists('employee_training');
    }
};
