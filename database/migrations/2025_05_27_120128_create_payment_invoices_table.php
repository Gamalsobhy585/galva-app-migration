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
        Schema::create('payment_invoices', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->string('reference_number', 50)->unique('reference_number');
            $table->integer('organization_id')->nullable()->default(1);
            $table->integer('cheque_id')->nullable();
            $table->integer('purchase_order_id')->nullable();
            $table->unsignedBigInteger('item_id')->nullable()->index('payment_invoices_item_id_foreign');
            $table->unsignedBigInteger('project_id')->nullable()->index('payment_invoices_project_id_foreign');
            $table->unsignedBigInteger('supplier_id')->nullable()->index('payment_invoices_supplier_id_foreign');
            $table->char('type_person', 10)->nullable()->default('sup');
            $table->bigInteger('exchange_request_id')->nullable();
            $table->string('po_number')->nullable();
            $table->string('invoice_number')->nullable();
            $table->string('notes')->nullable();
            $table->enum('payment_method', ['cashe', 'cheque_accept_payment', 'cheque_document', 'bank_transfer', 'withhold', 'closing', 'cheque_payable']);
            $table->date('date_payment');
            $table->string('exchange_rate')->nullable();
            $table->unsignedBigInteger('bank_id')->nullable()->index('payment_invoices_bank_id_foreign');
            $table->unsignedBigInteger('supplier_bank_id')->nullable()->index('payment_invoices_supplier_bank_id_foreign');
            $table->string('cheque_number')->nullable();
            $table->string('value')->nullable();
            $table->date('date_delivery_in')->nullable();
            $table->string('recipient_name_in')->nullable();
            $table->date('date_delivery_out')->nullable();
            $table->string('recipient_name_out')->nullable();
            $table->string('file_name')->nullable();
            $table->string('original_name')->nullable();
            $table->boolean('approved')->nullable();
            $table->bigInteger('userApproved_id')->nullable();
            $table->date('approved_at')->nullable();
            $table->unsignedBigInteger('user_id')->index('payment_invoices_user_id_foreign');
            $table->bigInteger('user_edit')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->string('order_number')->nullable();
            $table->softDeletes();
            $table->timestamps();
            $table->boolean('opening_balance')->nullable();
            $table->string('order_number_type', 200)->nullable()->default('0');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_invoices');
    }
};
