<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Address;
use Auth;
class AddressController extends Controller
{
    public function index()
    {
    	$records = Address::where('user_id', Auth::user()->id)->get();
    	if (count($records) > 0) {
    		return $this->apiSuccessMessageResponse('success', $records);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }
}
