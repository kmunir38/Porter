<?php

namespace App\Http\Controllers\Api\Order;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Role;
use App\Http\Resources\Frontend\Order\PastOrder as ViewPastOrder;
use App\Http\Resources\Frontend\Order\ViewOrder as ViewOrderDetail;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;
use App\Http\Resources\Frontend\Order\Getlatest as GetLatestOrder;
use App\Order;
use App\OrderItem;
use App\CancelOrder;
use App\Item;
use App\User;
use App\Notification;
use App\Setting;
use Auth;
use DB;

class IndexController extends Controller
{
	use ApiResponse;
	
	public function store(Request $request)
    { 
        $validator = Validator::make($request->all(), [
            'restaurant_id'     => 'required|exists:users,id',
            'card_id'     		=> 'nullable|exists:cards,id',
            'address_id'        => 'nullable|exists:addresses,id',
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }        

        $vat = Setting::where('name', 'vat')->first();	
        $order = new Order();
        $order->customer_id = \Auth::user()->id;
        $order->restaurant_id = $request->restaurant_id;
        $order->grocery_id = $request->grocery_id;
        $order->shopper_id = $request->shopper_id;
        $order->order_status = 'pending';
        $order->payment_method = $request->payment_method;
        $order->card_id = $request->card_id;
        $order->address_id = $request->address_id;
        $order->discount = $request->discount;
    	// $order->sub_total = 00;
        $order->vat = $vat->value;
        $order->delivery_cost = $request->delivery_cost;
        $order->distance = $request->distance;
        $order->note = $request->note;
        $order->grand_total = 00;
        $order->save();
        
        $grand_total = 0;
        $total = 0;

        foreach($request->item as $t) {

	        $item = Item::where('id', $t)->first();
        	$total += $item->price * $t['qty'];
            $grand_total = $total + $request->delivery_cost - $request->discount;
           
            if($order){
                $record             = new OrderItem();
                $record->item_id    = $t['id'];
                $record->order_id   = $order->id;
                $record->price      = $item->price;
                $record->sub_total  = $item->price * $t['qty'];                
                $record->qty        = $t['qty'];
                $record->save();
            }
            
	        // $order->order_items()->attach('order_id', 
	        //     [
	        //       'item_id'    	=> $t, 
	        //       'price'		=> $item->price,
	        //       'sub_total'	=> $item->price * $request->qty
	        //     ]);
    	}
        $order->sub_total   = $total;                   
    	$order->grand_total = $grand_total;

        $id = $request->restaurant_id;
        $vendorToken = User::find($order->customer_id);
        $device_token = $vendorToken->device_token;
        if($device_token) {
            $notification = new Notification();
            $message2 = "You Have A New Order";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
        }

    	$order->save();

        if ($order instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $order);
        }
    }

    public function assignOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'orderID'     => 'required|exists:orders,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }  
        $radius = 5;   

        $order = Order::where('id', $request->orderID)->first();
        $vendor = User::where('id', $order->restaurant_id)
        ->orWhere('id', $order->grocery_id)
        ->orWhere('id', $order->shopper_id)->first();
        $rider = User::role('rider')->where('onlineStatus', 1)->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$vendor->latitude, $vendor->longitude, $vendor->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        if(!$rider){
             return response()->json([
            'status' => 0,
            'message' => 'No rider Available at this time',
            'data' => []
            ]);
        } 

        $order->order_status   = 'ready';
        // $order->rider_id = $rider->id;
        $order->rider_id = 62;
        if($order->restaurant_id){
        
        $vendorToken = User::find($order->restaurant_id);        
        $device_token = $vendorToken->device_token;
        if($device_token) {
            $notification = new Notification();
            $message2 = "You Have A New Order";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
            }            
        }
        if($order->grocery_id){
        $vendorToken = User::find($order->grocery_id);        
        $device_token = $vendorToken->device_token;
        if($device_token) {
            $notification = new Notification();
            $message2 = "You Have A New Order";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
            }       
        }
        if ($order->shopper_id)) {
        $vendorToken = User::find($order->shopper_id);        
        $device_token = $vendorToken->device_token;
        if($device_token) {
            $notification = new Notification();
            $message2 = "You Have A New Order";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
            }    
        }
        $order->save();
        if ($order instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $order);
        }
    }

    public function acceptOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id'   => 'exists:users,id|nullable',
            'shopper_id'      => 'exists:users,id|nullable',
            'rider_id'        => 'exists:users,id|nullable',     
            'grocery_id'      => 'exists:users,id|nullable'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $id = $request->order_id;
        $data  = Order::find($id);

        $latitude   = $data->customer->latitude;
        $longitude  = $data->customer->longitude;

        $record = User::where('id', $data->restaurant_id)->orWhere('id', $data->grocery_id)->orWhere('id', $data->shopper_id)->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        ->having('distance', '<', 30)
        ->orderBy('distance')
        ->first();

        $cost = Setting::where('name', 'delivery_cost')->first();                 
        $result = $record->distance * $cost->value;

        $data->restaurant_id    = $request->restaurant_id;
        $data->shopper_id       = $request->shopper_id;
        $data->rider_id         = $request->rider_id;
        $data->grocery_id       = $request->grocery_id;
        if(!$request->rider_id){      
            $data->order_status     = 'preparing';            
        }

        $data->delivery_cost    = round($result,2);
        if($request->restaurant_id){
            $data->accepted_at_vendor = now();
        }
        if($request->restaurant_id){
            $data->accepted_at_rider = now();
        }

        $data->save();

        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function readyOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id'   => 'exists:users,id|nullable',            
            'order_id'        => 'required|exists:orders,id|nullable',            
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $id = $request->order_id;
        $data  = Order::find($id);

        $data->order_status   = 'ready';
        $data->completed_at_vendor   = now();
        $data->save();

        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function completeOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id'   => 'exists:users,id|nullable',
            'shopper_id'      => 'exists:users,id|nullable',
            'rider_id'        => 'exists:users,id|nullable',     
            'grocery_id'      => 'exists:users,id|nullable'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $id = $request->order_id;
        $data  = Order::where('id', $id)->where('restaurant_id', $request->vendor_id)
        ->orWhere('grocery_id', $request->vendor_id)
        ->orWhere('shopper_id', $request->vendor_id)
        ->orWhere('rider_id', $request->rider_id)
        ->first();
        if($request->rider_id){
            $data->order_status         = 'completed';
            $data->completed_at_rider   = now();

        } else {
            $data->order_status          = 'picked';
            $data->completed_at_vendor   = now();            
        }
        
        $data->save();

        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function rejectOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'orderID'     => 'required|exists:orders,id',
            'cancel_by'     => 'required|exists:users,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }  
        $data                   = new CancelOrder();
        $data->order_id         = $request->orderID;
        $data->cancel_by        = $request->cancel_by;
        $data->cancel_at        = now();
        $data->save();

        $record = Order::where('id', $request->orderID)->first();
        if(Auth::user()->role('customer'))
        {
            $record->order_status = 'cancelled';
            $record->save();
        } 
        $radius = 5;   
        $vendor = User::where('id', $record->restaurant_id)->first();
        $riders = User::role('rider')->where('onlineStatus', 1)->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$vendor->latitude, $vendor->longitude, $vendor->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        
        $orderCancellation = CancelOrder::where('order_id', $request->orderID)->count('order_id');
        
        if($orderCancellation == 5){
            return response()->json([
            'status' => 0,
            'message' => 'No rider found at this time',
            'data' => []
            ]);
        }
            
        $cancelled = CancelOrder::where('order_id', $record->id)->where('cancel_by', $riders->id)->first();
        if($cancelled){
            $cancellOrder = $cancelled->cancel_by;
        } else {
            $cancellOrder = 0;
        }

        $rider = User::role('rider')->where('onlineStatus', 1)->where('id', '!=' ,$cancellOrder)->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$vendor->latitude, $vendor->longitude, $vendor->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        $record->rider_id = $rider->id;  
        $record->save();

        if ($data instanceof \App\CancelOrder) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function pastOrders(Request $request)
    {
        if($request->id){
        $data = Order::where('restaurant_id',  $request->id)->where('order_status', 'completed')->get();
        }
        if($request->riderID){
        $data = Order::where('rider_id',  $request->riderID)->where('order_status', 'completed')->get();
        }
        $result = ViewPastOrder::collection($data)->toArray($request);    

         if (count($data) > 0) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function newOrders(Request $request)
    {
        $items = Order::where('order_status', '!=', 'cancelled')->where('restaurant_id', $request->vendorID)
        ->orWhere('grocery_id', $request->vendorID)
        ->orWhere('shopper_id', $request->vendorID)
        ->orWhere('rider_id', $request->vendorID)
        ->whereIn('order_status', ['pending', 'preparing', 'ready'])->get();
  
        $result = ViewPastOrder::collection($items)->toArray($request);    
        if (count($items) > 0) {
            return $this->apiSuccessMessageResponse('success', $result);
        } else {

            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }        
    }

    public function singleOrder(Request $request)
    {        
        $data = Order::where('id', $request->id)->first();
        $result = (new ViewOrderDetail($data))->resolve();
         if ($data) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function getALLOrderITems(Request $request)
    {
        $order = OrderItem::get();
        $result = GetOrderItems::collection($order)->toArray($request);
        return $result;
    }

    public function getOrderView(Request $request)
    {
        $data = Order::where('order_status', 'pending')
            ->where('restaurant_id', $request->vendorID)            
            ->orWhere('grocery_id', $request->vendorID)
            ->orWhere('shopper_id', $request->vendorID)
            ->orWhere('rider_id', $request->vendorID)
            ->latest()
            ->first();

        if ($data == NULL) {            
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        } else {
            $result =  (new GetLatestOrder($data))->resolve() ;
            return $this->apiSuccessMessageResponse('success', $result);
        }         
    }

    public function test(Request $request)
    {
        $data['order'] = OrderItem::where('order_id', $request->orderID)->get();
        return $data;
        $result =  GetLatestOrder::collection($data)->toArray($request);

        if ($data) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
        
    }
}   
