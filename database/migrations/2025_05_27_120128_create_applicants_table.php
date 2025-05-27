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
        Schema::create('applicants', function (Blueprint $table) {
            $table->primary(['id', 'uuid']);
             $table->integer('id')->autoIncrement(); 
             $table->char('uuid', 36);
            $table->string('current_salary', 150)->nullable();
            $table->integer('marital_status')->nullable()->comment('1: single, 2:married,3:widower,4:divorce,5:engaged');
            $table->tinyInteger('military_status')->nullable()->comment('1: done, 2:exemption,3:delayed');
            $table->string('current_company', 300)->nullable();
            $table->integer('id', true);
            $table->char('uuid', 36);
            $table->integer('organization_id');
            $table->string('application_date', 200)->nullable();
            $table->string('name_ar')->nullable();
            $table->string('name_en')->nullable();
            $table->tinyInteger('gender');
            $table->string('file_number')->nullable();
            $table->string('birth_date', 100)->nullable();
            $table->integer('source')->nullable()->comment('1:Linkedin,2:wuzzuf,3:internal_recommendation,4:facebook,5:website,6:email,7:walk-in,8:AM.Cham,9:Re Hiring, 10:OLX,11:EEC Recruitment Page,12:Jobs 6,13:Not Interested,14:Hold,15:hired but not start, 16:Wrong Number,17:didnt come,18:Didnt Answer,19:Forasna,20:Not Qualified,21:HR Deals,22:other');
            $table->tinyInteger('filled_executed')->nullable()->comment('1: YES exceuted, 2:NO filled');
            $table->string('recommend_from')->nullable();
            $table->string('phone_number')->nullable();
            $table->text('address')->nullable();
            $table->string('mobile')->nullable();
            $table->string('email')->nullable();
            $table->string('job_title')->nullable();
            $table->integer('qualification_type')->comment('1: master_degree, 2:hire, 3:middle, 4:lower, 5:no_qualification');
            $table->bigInteger('university')->nullable();
            $table->bigInteger('faculty')->nullable();
            $table->bigInteger('subject')->nullable();
            $table->year('graduation_year')->nullable();
            $table->string('school')->nullable();
            $table->string('attachment')->nullable();
            $table->timestamps();
            $table->integer('created_by');
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('applicants');
    }
};
