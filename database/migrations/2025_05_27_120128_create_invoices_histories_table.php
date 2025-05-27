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
        Schema::create('invoices_histories', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->unsignedBigInteger('invoice_id');
            $table->date('approve')->nullable();
            $table->date('dupdate')->nullable();
            $table->unsignedBigInteger('user_approve')->nullable();
            $table->unsignedBigInteger('user_edit')->nullable();
            $table->softDeletes();
            $table->timestamps();
            $table->unsignedBigInteger('user_delete')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices_histories');
    }
};
