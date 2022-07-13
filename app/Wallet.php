<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Wallet extends Model
{
    protected $table = 'wallet';

    protected $fillable = ['rider_id', 'balance', 'status'];

    public function rider()
    {
    	return $this->belongsTo('App\User', 'rider_id');
    }
} 
