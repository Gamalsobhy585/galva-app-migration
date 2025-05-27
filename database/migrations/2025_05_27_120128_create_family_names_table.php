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
        Schema::create('family_names', function (Blueprint $table) {
            $table->char('uuid', 36);
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('name_ar', 355);
            $table->string('name_en', 355);
            $table->unsignedBigInteger('sub_group_id')->index('family_names_sub_group_id_foreign');
            $table->boolean('both')->default(false);
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamps();

            $table->primary(['id', 'uuid']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('family_names');
    }
};
