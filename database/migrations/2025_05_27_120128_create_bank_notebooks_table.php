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
        Schema::create('bank_notebooks', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('start_from');
            $table->bigInteger('end_to');
            $table->string('number_bank_notebook', 200);
            $table->string('currency', 200);
            $table->bigInteger('bank_id');
            $table->tinyInteger('version')->default(0);
            $table->bigInteger('count');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->string('uuid')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bank_notebooks');
    }
};
