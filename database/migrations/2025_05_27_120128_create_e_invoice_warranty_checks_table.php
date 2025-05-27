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
        Schema::create('e_invoice_warranty_checks', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->bigInteger('client_id');
            $table->enum('client_type', ['b', 'p', 'f']);
            $table->string('side', 191);
            $table->string('project_number', 191);
            $table->bigInteger('supply_order');
            $table->string('value', 191);
            $table->enum('type', ['authentic_signature', 'notebook', 'payment_accepted', 'bank_deposit']);
            $table->string('source_name', 191)->nullable();
            $table->bigInteger('bank_id')->nullable();
            $table->string('bank_name', 191)->nullable();
            $table->string('cheque_number', 191);
            $table->date('check_date');
            $table->string('image', 191);
            $table->enum('document_nature', ['not_respond', 'respond'])->nullable();
            $table->text('purpose')->nullable();
            $table->string('giver_name', 191)->nullable();
            $table->string('recipient_name', 191)->nullable();
            $table->date('reply_date')->nullable();
            $table->softDeletes();
            $table->timestamps();
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
        Schema::dropIfExists('e_invoice_warranty_checks');
    }
};
