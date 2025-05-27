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
        Schema::create('purchase_requests', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('request_number')->unique('request_number');
            $table->unsignedBigInteger('requester_id')->index('purchase_requests_requester_id_foreign');
            $table->unsignedBigInteger('department_id')->nullable()->index('purchase_requests_sector_id_foreign');
            $table->unsignedBigInteger('sub_department_id')->nullable()->index('purchase_requests_department_id_foreign');
            $table->unsignedBigInteger('project_id')->nullable()->index('purchase_requests_project_id_foreign');
            $table->unsignedBigInteger('site_id')->nullable()->index('purchase_requests_site_id_foreign');
            $table->unsignedBigInteger('group_id')->index('purchase_requests_group_id_foreign');
            $table->boolean('approved')->default(false);
            $table->boolean('sent')->default(false);
            $table->string('expected_duration')->nullable();
            $table->string('purchase_type')->nullable()->default('purchase_in');
            $table->string('client_name')->nullable();
            $table->boolean('exist_comment')->default(false);
            $table->boolean('status_deactivate')->nullable()->default(false);
            $table->string('manufacturing_order_number')->nullable();
            $table->text('comment_deleted')->nullable();
            $table->string('delete_file_image', 191)->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->string('delete_file_image_name', 191)->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->text('comment')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchase_requests');
    }
};
