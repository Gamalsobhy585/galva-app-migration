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
        Schema::create('account_statements', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('description');
            $table->dateTime('date');
            $table->date('date_search');
            $table->string('debit')->nullable();
            $table->string('credit')->nullable();
            $table->string('balance')->nullable();
            $table->string('accountType');
            $table->unsignedBigInteger('user_id')->index('account_statements_user_id_foreign');
            $table->unsignedBigInteger('supplier_id')->index('account_statements_supplier_id_foreign');
            $table->unsignedBigInteger('invoice_id')->nullable()->index('account_statements_invoice_id_foreign');
            $table->unsignedBigInteger('payment_id')->nullable()->index('account_statements_payment_id_foreign');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('account_statements');
    }
};
