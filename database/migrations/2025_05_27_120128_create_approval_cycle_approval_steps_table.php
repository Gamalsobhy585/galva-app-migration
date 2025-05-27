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
        Schema::create('approval_cycle_approval_steps', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->unsignedBigInteger('approval_cycle_id')->index('approval_cycle_approval_steps_approval_cycle_id_foreign');
            $table->unsignedBigInteger('approval_step_id')->index('approval_cycle_approval_steps_approval_step_id_foreign');
            $table->string('level', 2);
            $table->unsignedBigInteger('next_id')->nullable()->index('approval_cycle_approval_steps_next_id_foreign');
            $table->unsignedBigInteger('previous_id')->nullable()->index('approval_cycle_approval_steps_previous_id_foreign');
            $table->timestamp('created_at')->nullable();
            $table->softDeletes();
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('approval_cycle_approval_steps');
    }
};
