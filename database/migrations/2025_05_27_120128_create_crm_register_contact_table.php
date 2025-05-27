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
        Schema::create('crm_register_contact', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('contact_type_id')->nullable();
            $table->string('industry_id', 191)->nullable();
            $table->string('company_name_en');
            $table->string('company_name_ar')->nullable();
            $table->text('address_en')->nullable();
            $table->text('address_ar')->nullable();
            $table->string('phone', 100);
            $table->string('email', 150)->nullable();
            $table->string('website', 200)->nullable();
            $table->string('contact_person')->nullable();
            $table->string('nationality', 100)->nullable();
            $table->tinyInteger('status')->default(0);
            $table->string('how_knew_about_us')->nullable();
            $table->text('contact_file')->nullable();
            $table->enum('available_opportunity', ['yes', 'no'])->nullable()->default('yes');
            $table->enum('status_register', ['prospected_client', 'SME', 'consultant', 'old_client', 'current_client'])->nullable();
            $table->integer('country_id')->nullable();
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->enum('reference', ['news', 'word_of_mouth', 'mail', 'tenders_alert'])->nullable();
            $table->boolean('locked')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_register_contact');
    }
};
