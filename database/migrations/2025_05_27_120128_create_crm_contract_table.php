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
        Schema::create('crm_contract', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable();
            $table->integer('quotation_id')->nullable();
            $table->integer('currency_id')->nullable();
            $table->integer('contact_id')->nullable();
            $table->date('contract_date')->nullable();
            $table->string('contract_duration', 191)->nullable();
            $table->date('contract_start_date')->nullable();
            $table->date('contract_end_date')->nullable();
            $table->enum('contract_type', ['purchase_order', 'fixed_unit_price', 'lump_sum', 'cost_plus'])->nullable();
            $table->text('attach_contract')->nullable();
            $table->enum('related_bond', ['yes', 'no'])->nullable();
            $table->enum('bond_type', ['letter_of_guarantee', 'check', 'cash'])->nullable();
            $table->string('bond_amount', 191)->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->enum('bid_bond_status', ['valid', 'expired', 'acquired_back'])->nullable();
            $table->text('notes')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_contract');
    }
};
