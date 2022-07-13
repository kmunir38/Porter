<?php

namespace App\Http\Controllers\Api\Rating;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Rating;
use Auth;

class IndexController extends Controller
{
	use ApiResponse;

    public function addRatings(Request $request)
    {
    	$data = new Rating();
        $data->customer_id = Auth::user()->id;
        $data->serviceProvider_id = $request->serviceProvider_id;
        $data->item_id = $request->item_id;
        $data->comments = $request->comments;
        $data->save();
        
    	if ($data instanceof \App\Rating) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }
}
