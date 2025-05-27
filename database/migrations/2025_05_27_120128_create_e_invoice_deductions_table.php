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
        Schema::create('e_invoice_deductions', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('uuid', 36)->nullable();
            $table->string('name', 191);
            $table->string('code', 5)->unique('deductions_code_unique');
            $table->bigInteger('deductionType_id');
            $table->timestamps();
            $table->softDeletes();
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
        Schema::dropIfExists('e_invoice_deductions');
    }
};
