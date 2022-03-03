<?php

namespace App\Http\Controllers\Api\Restaurent;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Order;
use App\User;
use App\Item;
use Auth;

class IndexController extends Controller
{
	use ApiResponse;

    public function profile(Request $request)
    {
        $data = User::where('id', $request->id)->get();
        $result = GetUser::collection($data)->toArray($request);
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

    public function updateProfile(Request $request)
    {
        $data = Item::where('restaurent_id', $request->id)->get();

        if (count($data) == null) {
            
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
        
        return $this->apiSuccessMessageResponse('success', $data);
    }
}
