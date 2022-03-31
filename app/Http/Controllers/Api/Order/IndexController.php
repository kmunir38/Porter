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
use App\Order;
use App\OrderItem;
use App\CancelOrder;
use App\Item;
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
            'item_id'     		=> 'required|exists:items,id',
            'qty'        		=> 'required|numeric',    
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }         
        $vat = Setting::where('name', 'vat')->first();	
        $order = new Order();
        $order->user_id = \Auth::user()->id;
        $order->restaurant_id = $request->restaurant_id;
        $order->payment_status = 'pending';
        $order->order_status = 'pending';
    	// $order->sub_total = 00;
        $order->vat = $vat->value;
        $order->grand_total = 00;
        $order->save();
        
        $grand_total = 0;

        foreach($request->item_id as $t) {

	        $item = Item::where('id', $t)->first();
        	$grand_total += $item->price * $request->qty;
            $total = $grand_total + $grand_total / 100 * $order->vat;
	        $order->order_items()->attach('order_id', 
	            [
	              'item_id'    	=> $t, 
	              'price'		=> $item->price,
	              'qty'			=> $request->qty,
	              'sub_total'	=> $item->price * $request->qty
	            ]);
    	}

    	$order->grand_total = $grand_total;
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
        $data                   = Order::find($id);
        $data->restaurant_id    = $request->restaurant_id;
        $data->shopper_id       = $request->shopper_id;
        $data->rider_id         = $request->rider_id;
        $data->grocery_id       = $request->grocery_id;
        $data->save();

        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function rejectOrder(Request $request)
    {
        $data                   = new CancelOrder();
        $data->order_id         = $request->order_id;
        $data->cancel_by        = $request->cancel_by;
        $data->cancel_at        = date('Y-m-d H:i:s');
        $data->save();

        $record = Order::where('id', $request->order_id)->first();
        if(Auth::user()->role('customer'))
        {
            $record->order_status = 'cancelled';
            $record->save();
        }    

        if ($data instanceof \App\CancelOrder) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function pastOrders(Request $request)
    {
        if($request->resID){
        $data = Order::where('restaurant_id',  $request->resID)->where('order_status', 'completed')->get();
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
        $items = Order::where('restaurant_id', Auth::user()->id)->where('order_status', 'pending')->get();
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
}
