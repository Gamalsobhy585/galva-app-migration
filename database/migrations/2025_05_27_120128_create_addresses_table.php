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
        Schema::create('addresses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('country_id')->nullable()->index('addresses_country_id_foreign');
            $table->unsignedBigInteger('governorate_id')->nullable()->index('addresses_governorate_id_foreign');
            $table->string('city_ar', 75)->nullable();
            $table->string('city_en', 75)->nullable();
            $table->string('street_ar', 100)->nullable();
            $table->string('street_en', 100)->nullable();
            $table->string('building_no', 4)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('addresses');
    }
};
