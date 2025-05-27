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
        Schema::create('welcome_message', function (Blueprint $table) {
            $table->integer('id', true);
            $table->unsignedInteger('organization_id');
            $table->string('department_id')->nullable();
            $table->text('notes')->nullable();
            $table->string('attachment', 355)->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->integer('updated_by')->nullable();
            $table->integer('created_by')->nullable();
            $table->softDeletes();
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('welcome_message');
    }
};
