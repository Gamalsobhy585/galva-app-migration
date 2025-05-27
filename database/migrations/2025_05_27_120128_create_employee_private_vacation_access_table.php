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
        Schema::create('employee_private_vacation_access', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('organization_id');
            $table->unsignedInteger('employee_id')->nullable();
            $table->unsignedInteger('vacation_type_id')->nullable();
            $table->unsignedTinyInteger('access')->nullable()->default(2);
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
            $table->dateTime('created_at');
            $table->dateTime('updated_at');
            $table->integer('create_timestamp')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_private_vacation_access');
    }
};
