<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CancelOrder extends Model
{
    protected $fillable = ['order_id', 'cancel_by', 'cancel_at'];


    public function order()
    {
    	return $this->belongsTo('App\Order', 'order_id');
    }
}
