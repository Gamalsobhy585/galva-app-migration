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
        Schema::create('crm_issuing_quotation_new', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('parent_id')->nullable();
            $table->bigInteger('quotation_type_id')->nullable();
            $table->integer('register_contact_id')->nullable();
            $table->boolean('status')->default(false);
            $table->integer('opportunity_id')->nullable();
            $table->char('quotation_ref', 15)->nullable();
            $table->integer('revision')->nullable();
            $table->date('issued_date');
            $table->bigInteger('issued_by');
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->text('attachments')->nullable();
            $table->enum('quotation_type', ['tender', 'price_offer', 'response_to_tender']);
            $table->enum('related_bid_bond', ['yes', 'no'])->nullable();
            $table->string('bid_bond_type', 191)->nullable();
            $table->string('bid_bond_amount', 191)->nullable();
            $table->enum('note_type', ['price_note', 'offer_note', 'financial_offer']);
            $table->text('offer_note_attachment')->nullable();
            $table->string('tax', 191)->nullable();
            $table->string('tax_val', 191)->nullable();
            $table->string('all_total', 191)->nullable();
            $table->string('sum_total', 191)->nullable();
            $table->text('validity')->nullable();
            $table->text('project')->nullable();
            $table->text('presenting')->nullable();
            $table->text('general_notes')->nullable();
            $table->text('terms_conditions')->nullable();
            $table->text('payment_terms')->nullable();
            $table->text('delivery_schedule')->nullable();
            $table->tinyInteger('is_confirmed')->default(2);
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
            $table->text('delivery_terms')->nullable();
            $table->string('currency_text', 191)->nullable();
            $table->text('tax_duties')->nullable();
            $table->tinyInteger('show_price')->default(1);
            $table->bigInteger('confirmed_by')->nullable();
            $table->integer('contact_person_id')->nullable();
            $table->text('financial_offer')->nullable();
            $table->enum('reference', ['news', 'word_of_mouth', 'mail', 'tenders_alert']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_issuing_quotation_new');
    }
};
