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
        Schema::table('approval_cycle_approval_steps', function (Blueprint $table) {
            $table->foreign(['approval_cycle_id'])->references(['id'])->on('approval_cycles')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['approval_step_id'])->references(['id'])->on('approval_steps')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['next_id'])->references(['id'])->on('approval_cycle_approval_steps')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['previous_id'])->references(['id'])->on('approval_cycle_approval_steps')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('approval_cycle_approval_steps', function (Blueprint $table) {
            $table->dropForeign('approval_cycle_approval_steps_approval_cycle_id_foreign');
            $table->dropForeign('approval_cycle_approval_steps_approval_step_id_foreign');
            $table->dropForeign('approval_cycle_approval_steps_next_id_foreign');
            $table->dropForeign('approval_cycle_approval_steps_previous_id_foreign');
        });
    }
};
