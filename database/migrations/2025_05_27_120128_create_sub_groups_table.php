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
        Schema::create('sub_groups', function (Blueprint $table) {
            $table->timestamp('updated_at')->nullable();
            $table->char('uuid', 36)->unique();
            $table->integer('id')->unique();
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('name_ar');
            $table->string('name_en');
            $table->unsignedBigInteger('group_id')->index('sub_groups_group_id_foreign');
            $table->boolean('both')->default(false);
            $table->timestamp('created_at')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->integer('created_by')->nullable();
            $table->softDeletes();

            $table->primary(['id', 'uuid']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sub_groups');
    }
};
