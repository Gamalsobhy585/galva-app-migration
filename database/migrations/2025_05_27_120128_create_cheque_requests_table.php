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
        Schema::create('cheque_requests', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('uuid', 36);
            $table->integer('organization_id')->nullable()->default(1);
            $table->string('cheque_number')->nullable();
            $table->string('number_cheque_request')->nullable();
            $table->char('type_cheque', 4);
            $table->unsignedBigInteger('requester_id')->index('cheque_requests_requester_id_foreign');
            $table->unsignedBigInteger('supplier_id')->nullable()->index('cheque_requests_supplier_id_foreign');
            $table->date('date');
            $table->string('total_debit')->nullable();
            $table->integer('exchange_rate')->nullable();
            $table->string('total_balance')->nullable();
            $table->integer('order_number')->nullable();
            $table->integer('invoice_number')->nullable();
            $table->string('operation_name')->nullable();
            $table->string('balance')->nullable();
            $table->string('project_id')->nullable();
            $table->string('statement')->nullable();
            $table->tinyInteger('name_type')->nullable();
            $table->bigInteger('name_type_id')->nullable();
            $table->string('sub_department_id', 200)->nullable();
            $table->bigInteger('currency');
            $table->timestamp('created_at_account')->nullable();
            $table->string('cheque_old', 200)->nullable();
            $table->boolean('exist_comment')->default(false);
            $table->boolean('sent')->default(false);
            $table->text('comment_delete')->nullable();
            $table->boolean('status_deactivate')->nullable()->default(false);
            $table->softDeletes();
            $table->timestamps();
            $table->string('file_delete_approval')->nullable();
            $table->string('comment_delete_approval', 20)->nullable();
            $table->bigInteger('deleted_approval_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cheque_requests');
    }
};
