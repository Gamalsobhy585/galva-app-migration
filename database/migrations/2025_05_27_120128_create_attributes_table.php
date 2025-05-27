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
        Schema::create('attributes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('organization_id');
            $table->boolean('type_id')->unsigned()->nullable();
            $table->string('name')->nullable();
            $table->string('name_en')->nullable();
            $table->boolean('deactivate_employee')->unsigned()->nullable()->default(false);
            $table->boolean('activate_employee')->unsigned()->nullable()->default(false);
            $table->boolean('show_exit_date')->unsigned()->nullable()->default(false);
            $table->text('text')->nullable();
            $table->string('value', 355)->nullable();
            $table->timestamps();
            $table->integer('create_timestamp')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('attributes');
    }
};
