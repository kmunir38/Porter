<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRiderDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rider_detail', function (Blueprint $table) {
            $table->id();
            $table->integer('rider_id');
            $table->string('vehicle_brand');
            $table->string('vehicle_model');
            $table->string('vehicle_manufacterer_year');
            $table->string('vehicle_plate_no');
            $table->string('vehicle_image');
            $table->string('rider_identification_image');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rider_detail');
    }
}
