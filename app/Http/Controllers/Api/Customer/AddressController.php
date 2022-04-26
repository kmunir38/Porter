<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator;
use App\Address;
use Auth;
class AddressController extends Controller
{
    use ApiResponse;
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

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address'       => 'required',
            'address_name'  => 'required',    
            'latitude'      => 'required',     
            'longitude'     => 'required'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $record = new Address();
        $record->latitude       = $request->latitude;
        $record->longitude      = $request->longitude;
        $record->address_name   = $request->address_name;
        $record->address        = $request->address;
        $record->user_id        = Auth::user()->id;
        $record->save();

        if ($record instanceof \App\Address) {
            return $this->apiSuccessMessageResponse('Success', $record);
        }
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address'       => 'required',
            'address_name'  => 'required',    
            'latitude'      => 'required',     
            'longitude'     => 'required'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $id = $request->id;
        $record = Address::find($id);
        $record->latitude       = $request->latitude;
        $record->longitude      = $request->longitude;
        $record->address_name   = $request->address_name;
        $record->address        = $request->address;
        $record->user_id        = Auth::user()->id;
        $record->save();

        if ($record instanceof \App\Address) {
            return $this->apiSuccessMessageResponse('Success', $record);
        }
    }
}
