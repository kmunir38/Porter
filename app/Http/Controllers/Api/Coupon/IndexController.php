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
		$coupons = Coupon::where('title', '>=', 0);
            
        if($request->restaurantID){
            $coupons->where('restaurant_id', $request->restaurantID);
        }
        $coupons = $coupons->get();
            
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
            'restaurant_id'   => 'required|exists:users,id',
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
        $coupons->restaurant_id     = $request->restaurant_id; 
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
            'restaurant_id'   => 'required|exists:users,id',
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
        $coupon->restaurant_id   = $request->restaurant_id; 
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

    public function verifyPromo(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'voucher_code'   => 'required|exists:coupons,voucher_code'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid Promo Code',
                'data' => []
            ]);
        }
        $promoCode = $request->voucher_code;
        $coupon = Coupon::where('voucher_code',  $promoCode)->first();

        if($coupon->exp_date < now()){
        return response()->json([
                'status' => 0,
                'message' => 'This promo code has been expired',
                'data' => []
            ]);
        } else {
            return $this->apiSuccessMessageResponse('Success', $coupon);    
        }
    }
}
