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
        Schema::create('positions_details', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->bigInteger('position_id');
            $table->string('type')->nullable()->comment('array [first_approve_status (1),second_approve_status (1),first_reject_status(1),second_reject_status(1)]');
            $table->string('by')->nullable()->comment('array[first_approve_by,second_approve_by,first_reject_by,second_reject_by]');
            $table->string('date')->nullable()->comment('array[first_approve_date,second_approve_date,first_reject_date,second_reject_date]');
            $table->string('reject_comments')->nullable()->comment('array[first_reject_comment,second_reject_comment]');
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
        Schema::dropIfExists('positions_details');
    }
};
