<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Resources\Frontend\Customer\ViewDeserts as ViewDesertPage;
use App\Http\Resources\Frontend\Order\OrderDetails as ViewDetails;
use App\Http\Resources\Frontend\Home\HomePage as GetHomeScreen;
use App\Order;
use App\User;
use App\OrderItem;
use App\Rating;
use App\Item;
use Auth;
use DB;
class IndexController extends Controller
{
	use ApiResponse;

    public function orderHistory()
    {
    	$items = Order::where('user_id', Auth::user()->id)->where('order_status', 'completed')->get();
    	if (count($items) > 0) {
    		return $this->apiSuccessMessageResponse('success', $items);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function desserts(Request $request)
    {
        $items = Item::whereHas('category', function ($q) {
            return $q->where('name', 'dessert');
        });
        $items = $items->latest()->get();
        // return $items;
        $result = ViewDesertPage::collection($items)->toArray($request);
        if (count($items) > 0) {
            return $this->apiSuccessMessageResponse('success', $result);
        } else {

            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function orderDetails(Request $request)
    {
        $item = OrderItem::where('order_id', $request->orderID)->get();
        $result = ViewDetails::collection($item)->toArray($request);

        if ($item) {
            return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function scopeIsWithinMaxDistance($query, $coordinates, $radius) 
    {

    $haversine = "(6371 * acos(cos(radians(" . $coordinates['latitude'] . ")) 
                    * cos(radians(`latitude`)) 
                    * cos(radians(`longitude`) 
                    - radians(" . $coordinates['longitude'] . ")) 
                    + sin(radians(" . $coordinates['latitude'] . ")) 
                    * sin(radians(`latitude`))))";

            return $query->select('*')
                 ->selectRaw("{$haversine} AS distance")
                 ->whereRaw("{$haversine} < ?", [$radius]);
    }

    public function ListingPopular($request)
    {
        $item = User::role('restaurant');
        
        if($request->latitude && $request->longitude && $request->distance) {

            $distance = $request->get('distance');

            if ($distance == '10km') {
              $distance = '10000';
            } 
            $item = $item->isWithinMaxDistance(['latitude' => $request->latitude, 'longitude' => $request->longitude], $distance);
        }
        return $item->get()->sortByDesc('ratings'); 
    }

    public function home(Request $request)
    {
         $users = User::role('restaurant');
        
        if($request->latitude && $request->longitude && $request->distance) {

            $distance = $request->get('distance');

            if ($distance == '5km') {
              $distance = '10000';
            } 
            $users = $users->isWithinMaxDistance(['latitude' => $request->latitude, 'longitude' => $request->longitude], $distance);
        }
        $users = $users->get()->sortByDesc('ratings'); 
        
        // $users = User::role('restaurant')->withCount(['userRating as average_rating' => function($query) {
        //     $query->select(DB::raw('coalesce(avg(rating),0)'));
        // }])->orderByDesc('average_rating')->get();
     
       $result = GetHomeScreen::collection($users)->toArray($request);
        if ($users) {
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
