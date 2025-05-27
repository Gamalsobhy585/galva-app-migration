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
        Schema::create('upgrade_versions', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->char('uuid', 40);
            $table->string('version');
            $table->string('name_en');
            $table->string('name_ar');
            $table->text('content')->nullable();
            $table->text('file_name')->nullable();
            $table->text('file')->nullable();
            $table->string('short_description_ar');
            $table->string('short_description_en');
            $table->bigInteger('created_by');
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
            $table->date('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('upgrade_versions');
    }
};
