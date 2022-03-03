<?php

namespace App\Http\Controllers\Api\Shopper;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Order;
use Auth;

class IndexController extends Controller
{
	use ApiResponse;

    public function orderHistory()
    {
    	$data['records'] = Order::where('shopper_id', Auth::user()->id)->get();

    	if (count($data['records']) > 0) {
    		return $this->apiSuccessMessageResponse('success', $data);
        } else {

            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }
}
