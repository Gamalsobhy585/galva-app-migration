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
        Schema::create('system_settings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->date('date_from');
            $table->date('date_to');
            $table->string('year', 10);
            $table->text('message_en')->nullable();
            $table->text('message_ar')->nullable();
            $table->integer('class')->nullable()->comment('1: info, 2: danger, 3: success, 4: secondary');
            $table->integer('module_type')->nullable()->comment('1: assign pms, 2: evaluate pms score, 3: medical, 4: data_version');
            $table->integer('percentage_competency_score')->nullable();
            $table->integer('percentage_kpi_score')->nullable();
            $table->text('url')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->bigInteger('updated_by')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('system_settings');
    }
};
