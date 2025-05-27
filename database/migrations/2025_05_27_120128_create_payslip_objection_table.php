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
        Schema::create('payslip_objection', function (Blueprint $table) {
            $table->integer('id')->unique();
            $table->char('uuid', 36)->unique();
            $table->integer('employee_id');
            $table->integer('organization_id');
            $table->boolean('objection_status');
            $table->integer('updated_by')->nullable();
            $table->text('notes')->nullable();
            $table->integer('created_by');
            $table->boolean('done')->default(false);
            $table->timestamps();
            $table->softDeletes();
            $table->integer('deleted_by')->nullable();

            $table->primary(['id', 'uuid']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payslip_objection');
    }
};
