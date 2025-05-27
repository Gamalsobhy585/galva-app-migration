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
        Schema::create('approval_timeline_comments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('organization_id')->nullable()->default(1);
            $table->text('comment')->nullable();
            $table->text('comment_approve')->nullable();
            $table->text('image_approve')->nullable();
            $table->text('name_image_approve')->nullable();
            $table->unsignedBigInteger('approval_timeline_id')->index('approval_timeline_comments_approval_timeline_id_foreign');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('approval_timeline_comments');
    }
};
