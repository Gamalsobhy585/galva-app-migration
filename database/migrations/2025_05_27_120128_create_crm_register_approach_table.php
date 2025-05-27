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
        Schema::create('crm_register_approach', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->enum('approach_for', ['lead', 'opportunity', 'quotation'])->nullable();
            $table->enum('reason', ['new_contact', 'response_to_inquiry', 'follow_up', 'refreshing', 'inquiry', 'other'])->nullable();
            $table->string('reason_other')->nullable();
            $table->enum('way_of_approach', ['meeting', 'mail', 'phone', 'other'])->nullable();
            $table->string('way_of_approach_other')->nullable();
            $table->bigInteger('made_approach_id')->nullable();
            $table->integer('next_step_type')->nullable();
            $table->string('next_step_value')->nullable();
            $table->date('notification_date')->nullable();
            $table->string('conclusion_of_approach')->nullable();
            $table->string('recommendation_for_follow_up')->nullable();
            $table->string('approach_file')->nullable();
            $table->string('link')->nullable();
            $table->text('close_opportunity_reason')->nullable();
            $table->tinyInteger('status')->nullable()->default(0);
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->dateTime('created_at');
            $table->dateTime('updated_at')->nullable();
            $table->dateTime('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_register_approach');
    }
};
