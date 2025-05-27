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
        Schema::create('e_invoice_foreigner_clients', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uuid', 36)->nullable();
            $table->string('company_name_ar', 191);
            $table->string('company_name_en', 191)->nullable();
            $table->string('person_name', 191)->nullable();
            $table->string('person_mobile', 16)->nullable();
            $table->string('person_email')->nullable()->unique('foreigner_clients_person_email_unique');
            $table->string('vat_id', 191)->nullable();
            $table->bigInteger('address_id');
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
        Schema::dropIfExists('e_invoice_foreigner_clients');
    }
};
