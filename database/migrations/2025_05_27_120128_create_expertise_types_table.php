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
        Schema::create('expertise_types', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('organization_id')->nullable();
            $table->char('uuid', 36);
            $table->string('name_ar');
            $table->string('name_en');
            $table->integer('expertise_category_id');
            $table->integer('created_by');
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->integer('updated_by');
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('expertise_types');
    }
};
