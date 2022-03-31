<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $fillable = ['order_id', 'item_id', 'price', 'sub_total'];


    public function order()
    {
        return $this->belongsToMany('App\Order', 'order_id');
    }

    public function orders()
    {
        return $this->belongsTo('App\Order', 'order_id');
    }

    public function item()
    {
        return $this->belongsTo('App\Item', 'item_id');
    }
}
