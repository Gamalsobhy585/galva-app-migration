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
        Schema::create('employee_vacation_balance_import_history', function (Blueprint $table) {
            $table->increments('id');
            $table->char('uuid', 36);
            $table->string('code', 10);
            $table->unsignedInteger('employee_id')->nullable();
            $table->integer('organization_id');
            $table->unsignedInteger('old_vacation_type_id')->nullable();
            $table->integer('new_vacation_type_id');
            $table->float('old_balance', 10)->unsigned()->nullable();
            $table->float('new_balance', 10);
            $table->float('old_remain', 10)->unsigned()->nullable();
            $table->float('new_remain', 10);
            $table->float('old_used', 10)->unsigned()->nullable();
            $table->float('new_used', 10);
            $table->string('year', 10)->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->integer('created_by');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_vacation_balance_import_history');
    }
};
