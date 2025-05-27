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
        Schema::create('vacation_type', function (Blueprint $table) {
            $table->increments('id');
            $table->char('uuid', 36);
            $table->unsignedInteger('organization_id');
            $table->string('name', 100)->nullable();
            $table->string('name_ar');
            $table->boolean('type')->unsigned()->nullable()->default(true);
            $table->unsignedInteger('balance')->nullable();
            $table->unsignedInteger('transaction')->nullable();
            $table->unsignedInteger('request_limit')->nullable();
            $table->unsignedInteger('service_limit')->nullable();
            $table->integer('pre_allowed')->nullable();
            $table->unsignedInteger('start_after_date')->nullable();
            $table->boolean('with_attach')->unsigned()->nullable()->default(false);
            $table->boolean('approval_needed')->unsigned()->nullable()->default(true);
            $table->boolean('auto_approved')->unsigned()->nullable()->default(false);
            $table->boolean('usable')->unsigned()->nullable()->default(false);
            $table->boolean('receivable')->unsigned()->nullable()->default(false);
            $table->boolean('with_days')->unsigned()->nullable()->default(false);
            $table->unsignedInteger('day_value')->nullable()->default(1);
            $table->unsignedInteger('limit_days')->nullable();
            $table->text('notes')->nullable();
            $table->timestamps();
            $table->integer('create_timestamp')->nullable();
            $table->softDeletes();
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vacation_type');
    }
};
