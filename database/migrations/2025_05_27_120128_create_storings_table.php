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
        Schema::create('storings', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->tinyInteger('organization_id')->default(1);
            $table->string('name');
            $table->bigInteger('employee_id');
            $table->bigInteger('project_id')->nullable();
            $table->bigInteger('parent')->nullable();
            $table->string('initial_balance');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('storings');
    }
};
