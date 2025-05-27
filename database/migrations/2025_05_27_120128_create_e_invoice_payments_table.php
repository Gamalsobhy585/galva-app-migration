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
        Schema::create('e_invoice_payments', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->enum('table', ['D', 'PO'])->comment('D: Document, PO: Purchase order');
            $table->bigInteger('table_id');
            $table->bigInteger('client_id');
            $table->enum('client_type', ['b', 'p', 'f'])->comment('b: Business client, p: Person client, f Foreigner client');
            $table->enum('payment_method', ['cashe', 'bank_transfer', 'cheque', 'deduction']);
            $table->bigInteger('payment_method_id')->nullable();
            $table->date('payment_date');
            $table->decimal('value', 50, 30);
            $table->string('file')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->decimal('payment_value', 10)->nullable();
            $table->integer('approved')->nullable()->default(0);
            $table->timestamp('approved_at')->nullable();
            $table->integer('approved_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_payments');
    }
};
