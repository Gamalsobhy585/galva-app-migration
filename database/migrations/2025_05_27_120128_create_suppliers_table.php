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
        Schema::create('suppliers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('name_ar')->nullable();
            $table->string('name_en')->nullable();
            $table->string('fax', 25)->nullable();
            $table->unsignedBigInteger('address_id')->nullable()->index('suppliers_address_id_foreign');
            $table->string('phone', 16)->nullable();
            $table->string('mobile', 16)->nullable();
            $table->string('email')->nullable();
            $table->string('website_url', 520)->nullable();
            $table->string('gmap_url', 520)->nullable();
            $table->string('logo')->nullable();
            $table->text('person_note')->nullable();
            $table->text('family_name_note')->nullable();
            $table->text('accredite_note')->nullable();
            $table->string('type')->nullable()->default('company');
            $table->string('tax_id_number')->nullable();
            $table->string('tax_id_number_file')->nullable();
            $table->string('commercial_registeration_number')->nullable();
            $table->date('commercial_registration_number_date')->nullable();
            $table->string('commercial_registeration_number_file')->nullable();
            $table->string('value_add_registeration_number')->nullable();
            $table->string('value_add_registeration_number_file')->nullable();
            $table->string('value_add_tax_number')->nullable();
            $table->string('tax_file_number_file')->nullable();
            $table->boolean('cash')->nullable();
            $table->boolean('system')->default(true);
            $table->integer('approved')->default(0);
            $table->bigInteger('user_id')->nullable();
            $table->tinyInteger('payment_method')->nullable();
            $table->softDeletes();
            $table->timestamps();
            $table->string('contact_type')->default('supplier');
            $table->integer('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->tinyInteger('delivery_type')->default(0)->comment('0 normal supp');
            $table->tinyInteger('is_hold')->default(0);
            $table->integer('hold_by')->nullable();
            $table->string('last_date_review', 50)->nullable();
            $table->integer('last_date_review_user')->nullable();
            $table->integer('count_not_null')->nullable();
            $table->integer('count_null')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('suppliers');
    }
};
