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
        Schema::create('crm_register_opportunity_details', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('opportunity_id')->nullable();
            $table->string('old_owner', 191);
            $table->string('new_owner', 191);
            $table->integer('switched_by')->nullable();
            $table->date('date');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crm_register_opportunity_details');
    }
};
