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
        Schema::create('crm_register_opportunity', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->tinyInteger('status')->default(0);
            $table->integer('industry_id')->nullable();
            $table->integer('contact_type_id');
            $table->integer('currency_id')->nullable();
            $table->string('opportunity_reference', 191);
            $table->string('opportunity_reference_content', 191)->nullable();
            $table->string('attachment', 191)->nullable();
            $table->string('opportunity_subject', 191);
            $table->string('group_name', 191);
            $table->text('opportunity_details')->nullable();
            $table->integer('related_activity')->nullable();
            $table->string('owner_of_activity', 191)->nullable();
            $table->date('notification_date')->nullable();
            $table->string('opportunity_size', 191)->nullable();
            $table->string('winning_probability', 191)->nullable();
            $table->enum('opportunity_type', ['in_hand', 'tender', 'not_specified'])->nullable();
            $table->string('number_of_competitive')->nullable();
            $table->enum('region', ['local', 'international'])->nullable();
            $table->string('submission_date', 191)->nullable();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->string('registration_number', 191)->nullable();
            $table->tinyInteger('is_opportunity')->default(0)->comment('0 is lead');
            $table->text('close_opportunity_reason')->nullable();
            $table->text('reason')->nullable();
            $table->text('attachment_opportunity')->nullable();
            $table->boolean('locked')->default(false)->comment('1 is locked');
            $table->integer('business_partner_contact')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_register_opportunity');
    }
};
