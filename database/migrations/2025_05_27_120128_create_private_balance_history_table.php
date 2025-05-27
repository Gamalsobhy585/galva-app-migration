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
        Schema::create('private_balance_history', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('employee_id')->nullable();
            $table->integer('organization_id');
            $table->unsignedInteger('vacation_type_id')->nullable();
            $table->date('date_from')->nullable();
            $table->date('date_to')->nullable();
            $table->integer('year')->nullable();
            $table->unsignedInteger('num_days')->nullable();
            $table->float('balance', 10)->unsigned()->nullable();
            $table->float('used', 10)->unsigned()->nullable()->default(0);
            $table->float('remain', 10)->unsigned()->nullable()->default(0);
            $table->unsignedInteger('created_by')->nullable();
            $table->timestamps();
            $table->integer('create_timestamp')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('private_balance_history');
    }
};
