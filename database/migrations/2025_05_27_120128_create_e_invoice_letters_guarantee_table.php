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
        Schema::create('e_invoice_letters_guarantee', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->integer('letters_guarantee_request_id')->nullable();
            $table->bigInteger('client_id')->nullable();
            $table->string('client_name', 191)->nullable();
            $table->enum('client_type', ['b', 'p', 'f'])->nullable();
            $table->string('side', 191)->nullable();
            $table->text('purpose')->nullable();
            $table->string('project_number', 191)->nullable();
            $table->string('supply_order_tax')->nullable();
            $table->unsignedBigInteger('supply_order')->nullable();
            $table->string('supply_order_name', 191)->nullable();
            $table->string('value', 191)->nullable();
            $table->string('cash_margin', 191);
            $table->enum('type', ['prepaid', 'primary_insurance', 'final_insurance', 'instant', 'maritime', 'financial'])->nullable();
            $table->unsignedBigInteger('bank_id')->nullable();
            $table->string('letter_guarantee_num', 191)->nullable();
            $table->text('image')->nullable();
            $table->date('release_date')->nullable();
            $table->date('expiry_date')->nullable();
            $table->integer('giver_name')->nullable();
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
        Schema::dropIfExists('e_invoice_letters_guarantee');
    }
};
