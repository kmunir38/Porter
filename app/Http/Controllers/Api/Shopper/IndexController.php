<?php

namespace App\Http\Controllers\Api\Shopper;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Resources\Frontend\Order\OrderHistory as History;
use App\Order;
use Auth;

class IndexController extends Controller
{
	use ApiResponse;

    public function orderHistory(Request $request)
    {
    	$data = Order::where('shopper_id', Auth::user()->id)->get();
        $result = History::collection($data)->toArray($request);
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
}
