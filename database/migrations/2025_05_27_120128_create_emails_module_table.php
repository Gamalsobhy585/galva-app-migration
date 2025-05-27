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
        Schema::create('emails_module', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('employee_id')->nullable();
            $table->integer('organization_id');
            $table->string('type', 50)->nullable();
            $table->unsignedInteger('ref_id')->nullable();
            $table->boolean('send')->unsigned()->nullable()->default(false);
            $table->timestamps();
            $table->integer('create_timestamp')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('emails_module');
    }
};
