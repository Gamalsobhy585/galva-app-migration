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
        Schema::create('sms_module', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('organization_id');
            $table->unsignedInteger('ref_id')->nullable();
            $table->string('type', 50)->nullable();
            $table->text('message')->nullable();
            $table->boolean('send')->unsigned()->nullable()->default(false);
            $table->string('response', 50)->nullable();
            $table->timestamps();
            $table->integer('create_timestamp')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sms_module');
    }
};
