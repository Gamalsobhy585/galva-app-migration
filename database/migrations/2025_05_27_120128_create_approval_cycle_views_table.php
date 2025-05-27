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
        Schema::create('approval_cycle_views', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('type');
            $table->integer('type_id');
            $table->integer('approval_step_type_detail_id');
            $table->integer('employee_id');
            $table->integer('action_id')->nullable()->comment('is employee id that take action of approved');
            $table->string('status', 200);
            $table->string('step', 200);
            $table->string('comment')->nullable();
            $table->integer('assign_to')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('approval_cycle_views');
    }
};
