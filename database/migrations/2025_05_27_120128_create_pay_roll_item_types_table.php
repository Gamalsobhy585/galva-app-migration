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
        Schema::create('pay_roll_item_types', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('name_en');
            $table->string('name_ar');
            $table->float('amount', null, 0);
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->integer('updated_by');
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pay_roll_item_types');
    }
};
