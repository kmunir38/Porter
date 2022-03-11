<?php

namespace App\Http\Controllers\Api\Coupon;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Coupon;

class IndexController extends Controller
{
    use ApiResponse;
	public function index(Request $request)
	{
		$coupons = Coupon::where('restaurent_id', $request->id)->get();
    	if (count($coupons) > 0) {
    		return $this->apiSuccessMessageResponse('success', $coupons);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
	}

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title'           => 'required',
            'voucher_code'    => 'required',
            'restaurent_id'   => 'required|exists:users,id',
            'discount'        => 'required',     
            'min_amount'      => 'required',     
            'exp_date'        => 'required'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $coupons = new Coupon();
        $coupons->title             = $request->title;
        $coupons->voucher_code      = $request->voucher_code;
        $coupons->discount          = $request->discount;
        $coupons->restaurent_id     = $request->restaurent_id; 
        $coupons->min_amount        = $request->min_amount;
        $coupons->exp_date          = $request->exp_date;    
        $coupons->save();
        
        if ($coupons instanceof \App\Coupon) {
            return $this->apiSuccessMessageResponse('Success', $coupons);
        }
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title'           => 'required',
            'voucher_code'    => 'required',
            'restaurent_id'   => 'required|exists:users,id',
            'discount'        => 'required',     
            'min_amount'      => 'required',     
            'exp_date'        => 'required'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $id = $request->id;
        $coupon                  = Coupon::find($id);
        $coupon->title           = $request->title;
        $coupon->voucher_code    = $request->voucher_code;
        $coupon->discount        = $request->discount;
        $coupon->restaurent_id   = $request->restaurent_id; 
        $coupon->min_amount      = $request->min_amount;
        $coupon->exp_date        = $request->exp_date;    
        $coupon->save();
        
        if ($coupon instanceof \App\Coupon) {
            return $this->apiSuccessMessageResponse('Success', $coupon);
        }
    }

    public function destroy(Request $request)
    {
        $id = $request->id;
        $coupon = Coupon::find($id);
        $coupon->delete();

        return $this->apiSuccessMessageResponse('Success', []);
    }
}
