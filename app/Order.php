<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use App\OrderItem;
use App\User;
use App\CancelOrder;
use DB;

class Order extends Model
{
	use LogsActivity;
    protected $fillable = ['customer_id', 'restaurant_id', 'rider_id', 'shopper_id', 'sub_total', 'discount', 'vat', 'grand_total', 'order_status', 'payment_method', 'card_id', 'address_id', 'payment_staus', 'commission', 'delivery_cost', 'distance', 'note'];

    protected static $logAttributes = ['customer_id', 'restaurant_id', 'rider_id', 'shopper_id', 'sub_total', 'discount', 'vat', 'grand_total', 'order_status', 'payment_method', 'card_id', 'address_id', 'payment_staus', 'commission', 'delivery_cost', 'distance', 'note'];
    protected static $logName = 'Order';
    protected static $logOnlyDirty = true;


    public function isWithinMaxDistance($query, $coordinates, $radius = 5) 
    {
        $haversine = "(6371 * acos(cos(radians(" . $coordinates['latitude'] . ")) 
                    * cos(radians(`latitude`)) 
                    * cos(radians(`longitude`) 
                    - radians(" . $coordinates['longitude'] . ")) 
                    + sin(radians(" . $coordinates['latitude'] . ")) 
                    * sin(radians(`latitude`))))";

            return $query->select('*')
                 ->selectRaw("{$haversine} AS distance")
                 ->whereRaw("{$haversine} < ?", [$radius]);
    }

    public function assignRider($latitude, $longitude, $radius = 5 )
    {
        $order = Order::where('id', $request->orderID)->first();

        $riders = User::role('rider')->where('onlineStatus', 1)->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$latitude, $longitude, $latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        $order->rider_id = $rider->id;
        $order->save();  
    }

    public function ItemsOrder()
    {
        return $this->hasMany('App\OrderItem');
    }

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
    	return $this->belongsTo('App\Item', 'restaurant_id');
    }

    public function customer()
    {
        return $this->belongsTo('App\User', 'customer_id');
    }

    public function restaurant()
    {
        return $this->belongsTo('App\User', 'restaurant_id');
    }

    public function shopper()
    {
        return $this->belongsTo('App\User', 'shopper_id');
    }

    public function rider()
    {
        return $this->belongsTo('App\User', 'rider_id');
    }

    public function address()
    {
        return $this->belongsTo('App\Address', 'address_id');
    }
}
