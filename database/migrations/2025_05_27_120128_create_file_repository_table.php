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
        Schema::create('file_repository', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('organization_id');
            $table->integer('parent_id')->nullable();
            $table->string('name_en');
            $table->string('name_ar');
            $table->string('size', 200)->nullable();
            $table->text('attachment')->nullable();
            $table->boolean('published')->nullable()->default(true)->comment('1 => published | 0 => not');
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('file_repository');
    }
};
