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
        Schema::create('e_invoice_letters_guarantee_changing', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->integer('letters_guarantee_id');
            $table->integer('value')->nullable();
            $table->string('cash_margin', 191);
            $table->date('expiry_date')->nullable();
            $table->integer('user_id');
            $table->text('image')->nullable();
            $table->softDeletes();
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
        Schema::dropIfExists('e_invoice_letters_guarantee_changing');
    }
};
