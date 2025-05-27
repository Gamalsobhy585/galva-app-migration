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
        Schema::create('shifts', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('name');
            $table->string('arabic_name', 200);
            $table->text('notes')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->tinyInteger('break');
            $table->integer('must_working_days')->nullable();
            $table->integer('compensation_days')->nullable();
            $table->integer('shift_substitute_id')->nullable()->index('fk_shift_substitute_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shifts');
    }
};
