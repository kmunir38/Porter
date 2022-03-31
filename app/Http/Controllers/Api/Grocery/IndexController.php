<?php

namespace App\Http\Controllers\Api\Grocery;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\Frontend\Grocery\Profile as GetProfile;
use App\Order;
use Auth;
use App\User;
class IndexController extends Controller
{
	use ApiResponse;

    public function orderHistory()
    {
    	$data['records'] = Order::where('restaurant_id', Auth::user()->id)->get();

    	if (count($data['records']) > 0) {
        return $this->apiSuccessMessageResponse('success', $data);
            
        } else {
            return response()->json([
                'status'    => 0,
                'message'   => 'No Record Found',
                'data'      => []
            ]);
        }        
    }

    public function profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id'         => 'required|exists:users,id',  
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $data = User::role('grocery')->where('id', $request->id)->first();

        $result = (new GetProfile($data))->resolve();
        if ($data !== null) {

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
