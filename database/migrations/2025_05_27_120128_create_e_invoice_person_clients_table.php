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
        Schema::create('e_invoice_person_clients', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->string('name_ar', 500);
            $table->string('name_en')->nullable();
            $table->string('national_id', 14)->unique('person_clients_national_id_unique');
            $table->string('mobile', 16)->nullable();
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
        Schema::dropIfExists('e_invoice_person_clients');
    }
};
