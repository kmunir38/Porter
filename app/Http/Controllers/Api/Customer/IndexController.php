<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Resources\Frontend\Customer\ViewDeserts as ViewDesertPage;
use App\Http\Resources\Frontend\Order\OrderDetails as ViewDetails;
use App\Order;
use App\OrderItem;
use App\Item;
use Auth;

class IndexController extends Controller
{
	use ApiResponse;
    public function orderHistory()
    {
    	$items = Order::where('user_id', Auth::user()->id)->where('order_status', 'completed')->get();
    	if (count($items) > 0) {
    		return $this->apiSuccessMessageResponse('success', $items);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function desserts(Request $request)
    {
        $items = Item::whereHas('category', function ($q) {
            return $q->where('name', 'dessert');
        });
        $items = $items->latest()->get();
        $result = ViewDesertPage::collection($items)->toArray($request);
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

    public function orderDetails(Request $request)
    {
        $item = OrderItem::where('order_id', $request->orderID)->get();
        $result = ViewDetails::collection($item)->toArray($request);

        if ($item) {
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
