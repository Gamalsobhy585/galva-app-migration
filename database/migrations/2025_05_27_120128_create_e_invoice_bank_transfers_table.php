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
        Schema::create('e_invoice_bank_transfers', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('bank_name', 191);
            $table->date('received_date');
            $table->date('issue_date')->nullable();
            $table->date('deposit_date')->nullable();
            $table->date('collect_date');
            $table->bigInteger('bank_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_bank_transfers');
    }
};
