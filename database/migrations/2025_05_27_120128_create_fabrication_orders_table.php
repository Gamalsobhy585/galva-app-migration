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
        Schema::create('fabrication_orders', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('reference_number');
            $table->string('client_name')->nullable();
            $table->integer('project_id')->nullable();
            $table->string('weight', 200)->nullable();
            $table->string('other_weight', 200)->nullable();
            $table->integer('unit_id')->nullable();
            $table->text('item_description')->nullable();
            $table->string('attachment')->nullable();
            $table->boolean('status_deactivate')->nullable()->default(false);
            $table->integer('created_by')->nullable();
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
        Schema::dropIfExists('fabrication_orders');
    }
};
