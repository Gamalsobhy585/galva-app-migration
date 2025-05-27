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
        Schema::create('e_invoice_documents_invalid_steps', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('document_id')->nullable();
            $table->longText('invalid_steps')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_documents_invalid_steps');
    }
};
