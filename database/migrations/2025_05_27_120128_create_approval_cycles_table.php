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
        Schema::create('approval_cycles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('name_ar');
            $table->string('name_en');
            $table->string('code', 100);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('approval_cycles');
    }
};
