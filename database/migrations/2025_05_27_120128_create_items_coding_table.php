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
        Schema::create('items_coding', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->char('uuid', 36);
            $table->string('code', 16);
            $table->string('name_en');
            $table->string('name_ar');
            $table->bigInteger('unit_id')->nullable();
            $table->bigInteger('family_name_id')->nullable();
            $table->bigInteger('group_id')->nullable();
            $table->bigInteger('sub_group_id')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('items_coding');
    }
};
