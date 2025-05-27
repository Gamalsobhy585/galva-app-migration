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
        Schema::create('projects', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('name_ar', 500);
            $table->string('name_en', 500);
            $table->string('code')->nullable();
            $table->string('type')->nullable();
            $table->unsignedBigInteger('item_id')->nullable()->index('projects_item_id_foreign');
            $table->unsignedBigInteger('business_nature_id')->nullable()->index('projects_business_nature_id_foreign');
            $table->text('description_ar')->nullable();
            $table->text('description_en')->nullable();
            $table->unsignedBigInteger('department_id')->index('projects_sector_id_foreign');
            $table->bigInteger('sub_department_id');
            $table->unsignedBigInteger('manager_id')->index('projects_manager_id_foreign');
            $table->unsignedBigInteger('delegated_id')->nullable()->index('projects_delegated_id_foreign');
            $table->unsignedBigInteger('group_id')->nullable()->index('projects_group_id_foreign');
            $table->boolean('completed')->default(false);
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
        Schema::dropIfExists('projects');
    }
};
