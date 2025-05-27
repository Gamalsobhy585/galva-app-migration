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
        Schema::create('e_invoice_purchase_orders', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->string('quotation_id', 191)->nullable();
            $table->bigInteger('client_id');
            $table->integer('client_code_id')->nullable();
            $table->enum('client_type', ['b', 'p', 'f'])->comment('b: Business client, p: Person client, f Foreigner client');
            $table->enum('type', ['budget', 'quantity'])->default('quantity');
            $table->enum('item_type', ['with_quotations', 'without_quotations', 'different_quotations'])->default('without_quotations');
            $table->string('purchase_order_reference', 191)->unique('purchase_order_reference');
            $table->string('project_name', 350);
            $table->bigInteger('main_project_name')->nullable();
            $table->string('project_number', 191);
            $table->string('project_contract_number', 191);
            $table->string('project_contract_code', 191)->nullable();
            $table->text('payment_terms');
            $table->string('purchaseorder_document', 191)->nullable();
            $table->text('comment')->nullable();
            $table->bigInteger('bank_id');
            $table->string('tax_type', 191)->nullable();
            $table->string('subtype', 191)->nullable();
            $table->string('tax_rate', 191)->nullable();
            $table->text('delivery_approach');
            $table->text('delivery_packaging')->nullable();
            $table->date('delivery_validate_date')->nullable();
            $table->string('delivery_export_port', 191)->nullable();
            $table->bigInteger('delivery_country_origin');
            $table->string('delivery_gross_weight', 191)->nullable();
            $table->string('delivery_net_weight', 191)->nullable();
            $table->text('delivery_terms');
            $table->boolean('primary_delivery_status')->default(false);
            $table->boolean('tax_rate_letter_report')->default(false);
            $table->boolean('final_delivery_status')->default(false);
            $table->integer('deduction_id')->nullable();
            $table->integer('business_nature_id')->nullable();
            $table->boolean('social_insurance_status')->default(false);
            $table->boolean('labor_insurance_status')->default(false);
            $table->boolean('tax_exemption_certificate_status')->default(false);
            $table->boolean('received_final_performance_bond_status')->default(false);
            $table->boolean('archive')->default(false);
            $table->boolean('approved')->default(false);
            $table->timestamps();
            $table->timestamp('approved_at')->nullable();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('approved_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_purchase_orders');
    }
};
