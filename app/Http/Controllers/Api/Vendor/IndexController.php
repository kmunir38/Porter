<?php

namespace App\Http\Controllers\Api\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Resources\Frontend\Restaurant\GetRestaurant as GetRestaurant;
use App\Order;
use App\User;
use App\Item;
use Auth;

class IndexController extends Controller
{
	use ApiResponse;

    public function profile(Request $request)
    {
        $data = User::where('id', $request->id)->first();
        $result = (new GetRestaurant($data))->resolve();
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

    public function updateProfile(Request $request)
    {
        $data = Item::where('restaurant_id', $request->id)->get();

        if (count($data) == null) {
            
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
        
        return $this->apiSuccessMessageResponse('success', $data);
    }

    public function getAllRestaurants(Request $request)
    {
        $data = User::role(['restaurant', 'grocery', 'shopper'])->get();
        $result = GetRestaurant::collection($data)->toArray($request);
        if (count($data) !== null) {

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
