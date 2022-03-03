<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use DB;

class Order extends Model
{
	use LogsActivity;
    protected $fillable = ['user_id', 'restaurent_id', 'rider_id', 'shopper_id', 'sub_total', 'vat', 'grand_total', 'order_status', 'payment_method', 'payment_staus'];

    protected static $logAttributes = ['user_id', 'restaurent_id', 'rider_id', 'shopper_id', 'sub_total', 'vat', 'grand_total', 'order_status', 'payment_method', 'payment_staus'];
    protected static $logName = 'Order';
    protected static $logOnlyDirty = true;

    public function OrderItem()
    {
        return $this->hasMany('App\OrderItem', 'id', 'order_id');
    }
    public function order_items()
    {
        return $this->belongsToMany(Order::class, 'order_items','order_id', 'item_id');
    }

    public function cancel_orders()
    {
        return $this->belongsToMany(Order::class, 'cancel_orders','order_id');
    }

    public function item()
    {
    	return $this->belongsTo('App\Item', 'restaurent_id');
    }

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function restaurent()
    {
        return $this->belongsTo('App\User', 'restaurent_id');
    }

    public function shopper()
    {
        return $this->belongsTo('App\User', 'shopper_id');
    }

    public function rider()
    {
        return $this->belongsTo('App\User', 'rider_id');
    }
}
