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
        Schema::create('e_invoice_documents', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->bigInteger('purchase_order_id');
            $table->date('date');
            $table->string('document_number', 191)->nullable()->unique('documents_document_number_unique');
            $table->bigInteger('organization_id');
            $table->double('extra_invoice_discount', null, 0)->nullable();
            $table->enum('type', ['I', 'C', 'D']);
            $table->string('version', 5)->default('1.0');
            $table->boolean('submit_status')->default(false);
            $table->boolean('archive')->default(false);
            $table->boolean('approved')->default(false);
            $table->bigInteger('user_id')->nullable();
            $table->timestamps();
            $table->string('uuid', 191)->nullable();
            $table->string('submission_id', 191)->nullable();
            $table->string('log_id', 191)->nullable();
            $table->string('hash_key', 191)->nullable();
            $table->string('document_status', 191)->nullable();
            $table->timestamp('date_time_received')->nullable();
            $table->string('publicUrl', 191)->nullable();
            $table->enum('signature_type', ['I', 'S'])->nullable()->default('I')->comment('I: Issuer, S: Service provider');
            $table->text('signature_value')->nullable();
            $table->softDeletes();
            $table->timestamp('approved_at')->nullable();
            $table->integer('approved_by')->nullable();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('e_invoice_documents');
    }
};
