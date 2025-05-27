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
        Schema::create('employee_vacation_balance_copy1', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code', 10);
            $table->unsignedInteger('employee_id')->nullable();
            $table->integer('organization_id')->default(1);
            $table->unsignedInteger('vacation_type_id')->nullable();
            $table->float('balance', 10)->unsigned()->nullable();
            $table->float('remain', 10)->unsigned()->nullable();
            $table->float('used', 10)->unsigned()->nullable();
            $table->string('year', 10)->nullable();
            $table->text('comment')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_vacation_balance_copy1');
    }
};
