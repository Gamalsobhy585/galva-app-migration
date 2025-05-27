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
        Schema::create('exchange_requests', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->char('uuid', 36);
            $table->tinyInteger('request_type');
            $table->tinyInteger('name_type')->nullable();
            $table->string('payment_type_with')->nullable();
            $table->tinyInteger('payment_type_without')->nullable();
            $table->bigInteger('cheque_number_request')->nullable();
            $table->bigInteger('requester_id')->nullable();
            $table->bigInteger('bank_id')->nullable();
            $table->bigInteger('number_bank_notebook')->nullable();
            $table->string('cheque_number')->nullable();
            $table->tinyInteger('status_cheque_number')->nullable()->default(0)->comment('0 not deleted and not used  - 1 - deleted and use - 2 - deleted and not use - null for bank_transfer');
            $table->bigInteger('name_type_id')->nullable();
            $table->string('other_name')->nullable();
            $table->string('value');
            $table->tinyInteger('export_location')->nullable();
            $table->tinyInteger('cheque_lined')->nullable();
            $table->bigInteger('first_signer')->nullable();
            $table->bigInteger('second_signer')->nullable();
            $table->tinyInteger('cheque_status')->nullable();
            $table->tinyInteger('bank_transfer_status')->nullable();
            $table->date('due_date')->nullable();
            $table->string('name_on_cheque')->nullable();
            $table->string('value_letter')->nullable();
            $table->bigInteger('from_account_number')->nullable();
            $table->string('to_account_number')->nullable();
            $table->char('type_person', 10)->nullable();
            $table->bigInteger('storing_id')->nullable();
            $table->string('bank_branch')->nullable();
            $table->string('purpose_transfer')->nullable();
            $table->text('notes')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exchange_requests');
    }
};
