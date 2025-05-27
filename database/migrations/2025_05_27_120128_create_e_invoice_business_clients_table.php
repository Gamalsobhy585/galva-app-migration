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
        Schema::create('e_invoice_business_clients', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->string('name_ar', 500);
            $table->string('name_en')->nullable();
            $table->string('fax', 191)->nullable();
            $table->bigInteger('address_id');
            $table->string('gmap_url', 520)->nullable();
            $table->string('phone', 16)->nullable();
            $table->string('mobile', 16)->nullable();
            $table->string('email', 191)->nullable();
            $table->string('website_url', 520)->nullable();
            $table->string('logo', 191)->nullable();
            $table->string('person_note', 520)->nullable();
            $table->string('accredite_note', 520)->nullable();
            $table->string('tax_id_number', 191)->unique('business_clients_tax_id_number_unique');
            $table->string('tax_id_number_file')->nullable();
            $table->string('commercial_registeration_number', 191)->nullable();
            $table->string('commercial_registeration_number_file')->nullable();
            $table->string('tax_file_number', 191)->nullable();
            $table->string('tax_file_number_file', 191)->nullable();
            $table->boolean('archive')->default(false);
            $table->boolean('approved')->default(false);
            $table->timestamps();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_business_clients');
    }
};
