<?php

namespace App\Http\Controllers\Admin\Coupon;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Coupon;

class IndexController extends Controller
{
    public function index()
    {
    	$items = Coupon::latest()->get();
    	return view('admin.coupons.index', compact('items'));
    }

    public function create()
    {
    	return view('admin.coupons.create');
    }

    public function store(Request $request)
    {
    	return redirect()->route('coupon.index');
    }

    public function edit($id)
    {
    	return view('admin.coupons.edit');
    }

    public function update(Request $request, $id)
    {
    	return redirect()->route('coupon.index');
    }

    public function destroy($id)
    {
    	$data = Coupon::find($id);
    	$data->delete();
    	return redirect()->route('coupon.index');
    }
}
