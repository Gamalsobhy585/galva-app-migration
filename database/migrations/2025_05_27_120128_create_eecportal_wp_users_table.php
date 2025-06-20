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
        Schema::create('eecportal_wp_users', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->string('user_login', 60)->default('')->index('user_login_key');
            $table->string('user_pass')->default('');
            $table->string('user_nicename', 50)->default('')->index('user_nicename');
            $table->string('user_email', 100)->default('')->index('user_email');
            $table->string('user_url', 100)->default('');
            $table->dateTime('user_registered');
            $table->string('user_activation_key')->default('');
            $table->integer('user_status')->default(0);
            $table->string('display_name', 250)->default('');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('eecportal_wp_users');
    }
};
