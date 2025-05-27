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
        Schema::create('cards', function (Blueprint $table) {
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->string('title');
            $table->string('employee_id');
            $table->tinyInteger('priority')->comment('0 - Normal priority ,
1 - Medium priority ,
2 - High priority ,
3 - Hold , 
4 - Essay and not to - evaluation ');
            $table->integer('board_id');
            $table->dateTime('time')->nullable();
            $table->date('due_date')->nullable();
            $table->string('attachment');
            $table->text('description');
            $table->tinyInteger('change_status_by');
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cards');
    }
};
