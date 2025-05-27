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
        Schema::create('pay_roll_types', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('uuid');
            $table->string('name_ar');
            $table->string('name_en');
            $table->integer('item_types_id')->index('item_types_id');
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->integer('updated_by')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pay_roll_types');
    }
};
