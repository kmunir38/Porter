<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
   protected $fillable = ['rider_id', 'brand', 'model', 'year', 'vehicle_no', 'license', 'vehicle_image'];

   public function rider()
   {
   		return $this->belongsTo('App\User', 'rider_id');
   }
}
