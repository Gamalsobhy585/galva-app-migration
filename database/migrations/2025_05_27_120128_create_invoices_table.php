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
        Schema::create('invoices', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->string('eta_id', 191)->nullable()->unique('eta_id');
            $table->string('eta_url', 191)->nullable()->unique('eta_url');
            $table->string('reference_number', 50)->unique('reference_number');
            $table->integer('organization_id')->nullable()->default(1);
            $table->unsignedBigInteger('item_id')->nullable()->index('invoices_item_id_foreign');
            $table->unsignedBigInteger('project_id')->nullable()->index('invoices_project_id_foreign');
            $table->unsignedBigInteger('business_nature_id')->nullable()->index('invoices_business_nature_id_foreign');
            $table->string('covenant_type')->nullable();
            $table->string('detection_number')->nullable();
            $table->unsignedBigInteger('supplier_id')->nullable()->index('invoices_supplier_id_foreign');
            $table->char('type_person', 10)->nullable()->default('sup');
            $table->string('purchases_type', 20)->nullable()->default('others');
            $table->string('po_number')->nullable();
            $table->string('due_date', 20)->nullable();
            $table->string('due_date_value', 20)->nullable();
            $table->string('due_date2', 20)->nullable();
            $table->string('due_date_value2', 20)->nullable();
            $table->date('date_invoice')->nullable();
            $table->string('invoice_number')->nullable();
            $table->text('specifications')->nullable();
            $table->integer('currency')->default(1);
            $table->string('exchange_rate', 20)->default('1');
            $table->string('price');
            $table->integer('amount')->default(1);
            $table->string('total');
            $table->string('discount', 50)->default('0');
            $table->integer('value_tax_rate')->nullable()->default(0);
            $table->string('value_tax')->nullable();
            $table->string('overall_total')->nullable();
            $table->integer('other_discount')->nullable();
            $table->string('total_after_discount')->nullable();
            $table->string('restrained_type')->nullable()->default('not_restrained');
            $table->unsignedBigInteger('nature_dealing_id')->nullable()->index('invoices_nature_dealing_id_foreign');
            $table->string('expense_type')->nullable()->default('cashe');
            $table->string('tax_deduction')->nullable()->default('0');
            $table->string('tax_deduction_value')->nullable();
            $table->string('net_total')->nullable();
            $table->integer('business_insurance_rate')->nullable();
            $table->string('business_insurance_value')->nullable();
            $table->string('net_total_after_business_insurance')->nullable();
            $table->string('notes')->nullable();
            $table->boolean('approved')->default(false);
            $table->unsignedBigInteger('user_id')->index('invoices_user_id_foreign');
            $table->softDeletes();
            $table->timestamps();
            $table->timestamp('first_edit')->nullable();
            $table->integer('transaction_taxes_id')->nullable();
            $table->integer('vat_id')->nullable();

            $table->unique(['eta_id'], 'eta_id_2');
            $table->unique(['eta_id'], 'eta_id_3');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
