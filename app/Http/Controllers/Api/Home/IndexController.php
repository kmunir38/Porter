<?php

namespace App\Http\Controllers\Api\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use App\User;

class IndexController extends Controller
{  
    use ApiResponse;
    
    public function homeScreen(Request $request)
    {
        $user = User::where('name', $request->id)->first();
        return $user;
        if ($user) {
            return $this->apiSuccessMessageResponse('success', $user);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }
}
