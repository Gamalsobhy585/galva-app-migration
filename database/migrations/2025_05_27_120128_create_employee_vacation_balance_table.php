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
        Schema::create('employee_vacation_balance', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code', 10);
            $table->unsignedInteger('employee_id')->nullable();
            $table->integer('organization_id')->default(1);
            $table->unsignedInteger('vacation_type_id')->nullable();
            $table->float('balance', 10)->unsigned()->nullable();
            $table->float('reserved_balance', 10)->unsigned()->default(0);
            $table->float('remain', 10)->unsigned()->nullable();
            $table->float('used', 10)->unsigned()->nullable();
            $table->string('year', 10)->nullable();
            $table->text('comment')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->integer('updated_by')->nullable();
            $table->tinyInteger('is_hidden')->nullable();
            $table->softDeletes();
            $table->tinyInteger('checked')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_vacation_balance');
    }
};
