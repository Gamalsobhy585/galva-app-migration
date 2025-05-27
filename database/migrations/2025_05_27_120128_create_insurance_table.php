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
        Schema::create('insurance', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('reference_number', 50);
            $table->tinyInteger('insurance_type');
            $table->tinyInteger('construction_type')->nullable();
            $table->bigInteger('requester_id');
            $table->bigInteger('project_id')->nullable();
            $table->string('project_number', 200)->nullable();
            $table->tinyInteger('desk')->nullable();
            $table->bigInteger('governorate_id')->nullable();
            $table->string('claim_number', 200)->nullable();
            $table->string('abstract_number', 200)->nullable();
            $table->string('payment_method', 200);
            $table->bigInteger('exchange_request_id')->nullable();
            $table->text('statement');
            $table->date('document_date');
            $table->string('value');
            $table->bigInteger('updated_by')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('insurance');
    }
};
