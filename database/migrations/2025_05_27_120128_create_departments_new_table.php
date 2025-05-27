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
        Schema::create('departments_new', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->integer('business_unit_id');
            $table->string('name_ar');
            $table->string('name_en');
            $table->unsignedBigInteger('head_id')->index('sectors_head_id_foreign');
            $table->string('days_off');
            $table->unsignedBigInteger('delegated_id')->index('sectors_delegated_id_foreign');
            $table->unsignedBigInteger('parent_id')->nullable()->default(1)->index('sectors_parent_id_foreign');
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('departments_new');
    }
};
