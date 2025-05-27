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
        Schema::create('approval_timelines', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('table_name');
            $table->bigInteger('record_id');
            $table->unsignedBigInteger('approval_cycle_approval_step_id')->index('approval_timelines_approval_cycle_approval_step_id_foreign');
            $table->enum('approval_status', ['P', 'A', 'RV', 'RJ'])->default('P')->comment('P: Pending, A: Approved, RV: Revert, RJ: Reject');
            $table->integer('business_action')->default(0);
            $table->unsignedBigInteger('user_id')->index('approval_timelines_user_id_foreign');
            $table->integer('action_id')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('approval_timelines');
    }
};
