<?php
namespace App\Http\Controllers\Api\Notification;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use App\Http\Resources\Frontend\Notification\View as ViewList;
use App\Notification;

class IndexController extends Controller
{   
    use ApiResponse;
   	public function index(Request $request)
   	{
   		$records = Notification::where('receiver_id', $request->user_id)->latest()->get();
    	$result = ViewList::collection($records)->toArray($request);
    	if ($result == null) {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
       return response()->json([
                'status' => 1,
                'message' => 'Success',
                'data' => $result
            ]);
   	}
   	
   	public function destroy(Request $request)
   	{
   		$data = Notification::where('id', $request->id)->first();
   		$data->delete();
    	return $this->apiSuccessMessageResponse('Success', []);
   	}
}
