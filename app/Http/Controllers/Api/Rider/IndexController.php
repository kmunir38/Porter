<?php

namespace App\Http\Controllers\Api\Rider;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Order;
use App\BankInfo;
use App\Vehicle;
use Auth;

class IndexController extends Controller
{
	use ApiResponse;

    public function orderHistory()
    {
    	$orders = Order::where('rider_id', Auth::user()->id)->get();

    	if (!$orders) {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
        
        return $this->apiSuccessMessageResponse('success', $orders);
    }

    public function bankInfo(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fullname'      => 'required',
            'bank_name'     => 'required',
            'acc_no'        => 'required',  
            'iban'          => 'required',   
            'branch'        => 'required'   
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $data = new BankInfo();
        $data->user_id = Auth::user()->id;
        $data->fullname = $request->fullname;
        $data->bank_name = $request->bank_name;
        $data->acc_no = $request->acc_no;
        $data->iban = $request->iban;
        $data->branch = $request->branch;
        $data->save();
        
        return $this->apiSuccessMessageResponse('success', $data);
    }

    public function addVehicle(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'brand'   => 'required',
            'model'   => 'required',
            'year'    => 'required',  
            'vehicle_no'  => 'required',   
            'license'    => 'required',   
            'vehicle_image'  => 'required'   
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $image = $request->vehicle_image;
        $licenseImg = $request->license;
        $data = new Vehicle();
        
        if ($image) {
          $image_name = "";
          if (preg_match('/^data:image\/(\w+);base64,/', $image, $type)) {

            $encoded_base64_image = substr($image, strpos($image, ',') + 1);
            $type = strtolower($type[1]);

            $decoded_image = base64_decode($encoded_base64_image);

            $resized_image = \Intervention\Image\Facades\Image::make($decoded_image);
            $path = public_path('uploads/vehicles');

            if (!file_exists($path))
            {
                mkdir($path);
            }

            $image_name = uniqid().'.'.'png';

            \File::put(public_path('uploads/vehicles') . '/' . $image_name,(string) $resized_image->encode());
            }   
        }

        if ($licenseImg) {
          $licence = "";
          if (preg_match('/^data:image\/(\w+);base64,/', $licenseImg, $type)) {

            $encoded_base64_image = substr($image, strpos($licenseImg, ',') + 1);
            $type = strtolower($type[1]);

            $decoded_image = base64_decode($encoded_base64_image);

            $resized_image = \Intervention\Image\Facades\Image::make($decoded_image);
            $path = public_path('uploads/vehicles');

            if (!file_exists($path))
            {
                mkdir($path);
            }

            $license = uniqid().'.'.'png';

            \File::put(public_path('uploads/vehicles') . '/' . $license,(string) $resized_image->encode());
            }  
        }

        $data->rider_id      = Auth::user()->id;
        $data->brand        = $request->brand;
        $data->model        = $request->model;
        $data->year         = $request->year;   
        $data->vehicle_no   = $request->vehicle_no;
        $data->license      = 'public/uploads/vehicles/'.$license;
        $data->vehicle_image = 'public/uploads/vehicles/'.$image_name;
        $data->save();
        
        return $this->apiSuccessMessageResponse('success', $data);
    }
}
