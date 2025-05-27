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
        Schema::create('multi_organizations', function (Blueprint $table) {
            $table->char('uuid', 36)->unique();
            $table->integer('id')->unique();
            $table->string('name_ar');
            $table->string('name_en');
            $table->string('mobile', 16);
            $table->string('tax_id_number', 11)->nullable();
            $table->string('commercial_registration_number', 7)->nullable();
            $table->string('tax_file_number', 191)->nullable();
            $table->string('short_name', 4);
            $table->string('email');
            $table->string('address_ar');
            $table->string('address_en');
            $table->string('location_url');
            $table->string('logo');
            $table->boolean('deactivate')->default(false);
            $table->timestamps();
            $table->integer('updated_by')->nullable();

            $table->primary(['id', 'uuid']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('multi_organizations');
    }
};
