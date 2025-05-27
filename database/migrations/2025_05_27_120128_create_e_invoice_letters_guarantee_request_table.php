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
        Schema::create('e_invoice_letters_guarantee_request', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->enum('client_type', ['b', 'p', 'f', '']);
            $table->bigInteger('client_id')->nullable();
            $table->string('client_name', 191)->nullable();
            $table->text('client_address')->nullable();
            $table->string('supply_order_tax')->nullable();
            $table->bigInteger('supply_order')->nullable();
            $table->string('supply_order_name', 191)->nullable();
            $table->string('main_project_name', 191)->nullable();
            $table->string('project_name', 191)->nullable();
            $table->string('project_number', 191)->nullable();
            $table->string('total_amount', 191)->nullable();
            $table->integer('purchase_order_percentage')->nullable();
            $table->integer('value');
            $table->enum('type', ['prepaid', 'primary_insurance', 'final_insurance', 'instant', 'maritime', 'financial']);
            $table->integer('duration_in_month');
            $table->date('release_date');
            $table->date('expiry_date');
            $table->integer('attached')->default(0);
            $table->bigInteger('user_id');
            $table->date('deleted_at')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
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
        Schema::dropIfExists('e_invoice_letters_guarantee_request');
    }
};
