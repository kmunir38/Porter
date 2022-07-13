<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Support\Facades\Validator;
use App\OrderItem;
use App\User;
use App\CancelOrder;
use DB;

class Order extends Model
{
	use LogsActivity;
    protected $fillable = ['customer_id', 'restaurant_id', 'rider_id', 'shopper_id', 'sub_total', 'discount', 'vat', 'grand_total', 'order_status', 'payment_method', 'card_id', 'address_id', 'payment_staus', 'commission', 'delivery_cost', 'distance', 'note', 'vat_amount'];

    protected static $logAttributes = ['customer_id', 'restaurant_id', 'rider_id', 'shopper_id', 'sub_total', 'discount', 'vat', 'grand_total', 'order_status', 'payment_method', 'card_id', 'address_id', 'payment_staus', 'commission', 'delivery_cost', 'distance', 'note', 'vat_amount'];
    protected static $logName = 'Order';
    protected static $logOnlyDirty = true;

    protected $appends = ['delivery_fee', 'average_time', 'to_store', 'from_store', 'items_array'];

    public function getDeliveryFeeAttribute()
    {
      //
    }

    public function getAverageTimeAttribute($request)
    {        
        $time = 5;  //minutes per kilometer 
        $address = Address::where('id', $this->address_id)->where('user_id', $this->customer_id)->first();
        $user = User ::where('id', $this->customer_id)->first();    
        $data = User::where('id',  $this->customer->id)->first();
        
        if($this->restaurant){
        $add = User::where('id',  $this->restaurant->id)->first();            
        }
        if($this->grocery){
        $add = User::where('id',  $this->grocery->id)->first();            
        }
        if($this->shopper){
        $add = User::where('id',  $this->shopper->id)->first();            
        }
     
        $latitude   = $add->latitude;
        $longitude  = $add->longitude;

        if($user->latitude == NULL){
             $record = Address::where('user_id', $this->customer->id)->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
            ->having('distance', '<', 30)
            ->orderBy('distance')
            ->first();
        } else {
            $record = User::where('id', $this->customer->id)->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
            ->having('distance', '<', 30)
            ->orderBy('distance')
            ->first();  
        }
        
        $result = round($record->distance);
        $avg_time =  $result * $time;
        return [$avg_time,"to ",$avg_time + 5];       
    }

    public function getToStoreAttribute($request)
    {
        // if($this->rider_id){
        // $add = User::where('id',  $this->rider->id)->first();
        
        // $latitude   = $add->latitude;
        // $longitude  = $add->longitude;

        // if($this->restaurant_id){
        // $record = User::where('id', $this->restaurant->id)
        // ->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        // ->having('distance', '<', 30)
        // ->orderBy('distance')
        // ->first();
        // }
        // if(isset($this->grocery->id)){
        // $record = User::where('id', $this->grocery->id)
        // ->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        // ->having('distance', '<', 30)
        // ->orderBy('distance')
        // ->first();
        // }
        // if(isset($this->shopper->id)){
        // $record = User::where('id', $this->shopper->id)
        // ->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        // ->having('distance', '<', 30)
        // ->orderBy('distance')
        // ->first();
        // }
        // $result = round($record->distance);
        // // $avg_time =  $result * $time;
        // return $result; 
        // }     
    }
    
    public function getItemsArrayAttribute($request)
    {
        $data = DB::table('items')->join('order_items', 'items.id', '=' ,'order_items.item_id')
            ->where('order_items.order_id', '=', $this->id)->select('items.id', 'name', 'image', 'qty', 'order_items.price')->get();
        return $data;        
    }

    public function getFromStoreAttribute($request)
    {
        // if($this->rider_id){
        // $add = User::where('id',  $this->customer->id)->first();
        
        // $latitude   = $add->latitude;
        // $longitude  = $add->longitude;

        // if(isset($this->restaurant->id)){
        // $record = User::where('id', $this->restaurant->id)
        // ->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        // ->having('distance', '<', 30)
        // ->orderBy('distance')
        // ->first();            
        // }
        // if(isset($this->grocery->id)){
        // $record = User::where('id', $this->grocery->id)
        // ->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        // ->having('distance', '<', 30)
        // ->orderBy('distance')
        // ->first();            
        // }   
        // if(isset($this->shopper->id)){
        // $record = User::where('id', $this->shopper->id)
        // ->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        // ->having('distance', '<', 30)
        // ->orderBy('distance')
        // ->first();            
        // }    

        // $result = round($record->distance);
        // // $avg_time =  $result * $time;
        // return $result; 
        // }     
    }

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

    public function grocery()
    {
        return $this->belongsTo('App\User', 'grocery_id');
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
