<?php

namespace App\Http\Controllers\Admin\Logs;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use DB;

class IndexController extends Controller
{
    public function index()
    {
    	$logs = DB::table('activity_log')->where("created_at", ">", Carbon::now()->subDay())->where("created_at", "<", Carbon::now())->latest()->get();
    	return view('admin.logs.index', compact('logs'));
    }

    public function logsSearch(Request $request)
    {
    	$fromDate = date('Y-m-d 00:00:00', strtotime($request->from_date));
    	$toDate = date('Y-m-d 23:59:59', strtotime($request->from_to));
    	$logs = DB::table('activity_log')->whereBetween('created_at', array($fromDate, $toDate))->get();

    	return view('admin.logs.search', compact('logs'));
    }
}
