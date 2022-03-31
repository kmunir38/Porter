<?php

namespace App\Http\Controllers\Admin\Coupon;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Coupon;
use App\User;

class IndexController extends Controller
{
    public function index()
    {
    	$items = Coupon::latest()->get();
    	return view('admin.coupons.index', compact('items'));
    }

    public function create()
    {
        $restaurant = User::role('restaurant')->pluck('name', 'id');
        $grocery = User::role('grocery')->pluck('name', 'id');
    	return view('admin.coupons.create', compact('restaurant', 'grocery'));
    }

    public function store(Request $request)
    {
        $validation = [
            'title'             => 'required',
            'discount'          => 'required',
            'voucher_code'      => 'required',
            'exp_date'          => 'required|date'
        ];

        if($request->restaurant_id) {
            $validation['restaurant_id'] = 'required|exists:users,id';
        } else {
            $validation['grocery_id'] = 'required|exists:users,id';
        }
        $item                   = new Coupon();
        $item->title            = $request->title;
        $item->restaurant_id    = $request->restaurant_id;
        $item->grocery          = $request->grocery;
        $item->discount         = $request->discount;
        $item->voucher_code     = $request->voucher_code;
        $item->exp_date         = $request->exp_date;
        $item->description         = $request->description;
        $item->save();        
        Toastr::success('Restaurant created successfully.', 'Success');
    	return redirect()->route('coupon.index');
    }

    public function edit($id)
    {
        $restaurant = User::role('restaurant')->pluck('name', 'id');    
        $grocery = User::role('grocery')->pluck('name', 'id');
        $coupon = Coupon::find($id);
    	return view('admin.coupons.edit', compact('coupon','restaurant', 'grocery'));
    }

    public function update(Request $request, $id)
    {
        $validation = [
            'title'             => 'required',
            'discount'          => 'required',
            'voucher_code'      => 'required',
            'exp_date'          => 'required|date'
        ];

        if($request->restaurant_id) {
            $validation['restaurant_id'] = 'required|exists:users,id';
        } else {
            $validation['grocery_id'] = 'required|exists:users,id';
        }

        $this->validate($request, $validation);
        $item = Coupon::find($id);
        $item->title            = $request->title;
        $item->restaurant_id    = $request->restaurant_id;
        $item->grocery_id       = $request->grocery_id;
        $item->discount         = $request->discount;
        $item->voucher_code     = $request->voucher_code;
        $item->exp_date         = $request->exp_date;
        $item->description      = $request->description;
        $item->save();
        Toastr::success('Restaurant update successfully.', 'Success');        
    	return redirect()->route('coupon.index');
    }

    public function destroy($id)
    {
    	$data = Coupon::find($id);
    	$data->delete();
    	return redirect()->route('coupon.index');
    }
}
