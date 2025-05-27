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
        Schema::create('notifications_details', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('notification_id');
            $table->boolean('read_message')->default(false)->comment('0 => no | 1 => yes');
            $table->integer('read_by');
            $table->timestamp('read_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notifications_details');
    }
};
