<?php

namespace App\Http\Controllers\admin\rider;

use App\Http\Controllers\Controller;
use App\RiderDetail;
use Illuminate\Http\Request;

class RiderDetailController extends Controller
{
    public function index()
    {
        $rider_details = RiderDetail::orderBy('id', 'desc')->get();
        return view('admin.riders.rider_details.index', compact('rider_details'));
    }

    public function view($id)
    {
        $rider_detail = RiderDetail::find($id);

        if (!$rider_detail) {
            abort(404);
        }

        return view('admin.riders.rider_details.view', compact('rider_detail'));
    }
}
