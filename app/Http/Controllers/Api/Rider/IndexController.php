<?php

namespace App\Http\Controllers\Api\Rider;

use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\Frontend\Rider\BalancePage as GetBalancePage;
use App\Http\Resources\Frontend\Order\CashOrders as GetCashOrderHistory;
use App\Http\Resources\Frontend\Order\NewOrder as GetOrderItems;
use App\Http\Resources\Frontend\Order\CountCashOrders as GetOrdersCount;
use App\Order;
use App\BankInfo;
use App\Vehicle;
use App\User;
use App\Setting;
use App\Wallet;
use Auth;
use DB;

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

    public function balancePage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $record = User::where('id', $request->id)->first();
        $result = (new GetBalancePage($record))->resolve();            
        
        return $this->apiSuccessMessageResponse('success', $result);
    }


    // cash orders api
    public function cashOrders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'riderID' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $commission = Setting::where('name', 'commission')->first();
        $data['user'] = (new User())->getUserDetails($request, Auth::user()->id);
        $data['cash_orders_today'] = Order::where('rider_id', $request->riderID)->where('order_status', 'completed')->where('payment_method', 'cash')->whereDate('created_at', '=', date('Y-m-d', strtotime($request->date)))->count('id');
        $data['cash_orders_commission'] = Order::where('rider_id', $request->riderID)->where('order_status', 'completed')->where('payment_method', 'cash')->whereDate('created_at', '=', date('Y-m-d', strtotime($request->date)))->sum('delivery_cost');
        $data['balanceTo_porter'] = round($data['cash_orders_commission'] / 100 * $commission->value, 2);
        $data['total'] = round($data['cash_orders_commission'] - $data['balanceTo_porter'], 2);

        $data['records'] = (new User())->getCashPaymentHistory($request, Auth::user()->id);

        if ($data['records'] == null) {
            return $this->apiErrorMessageResponse('No Record Found!');
        }
   
        // $result = GetCashOrderHistory::collection($data)->toArray($request);    
        return $this->apiSuccessMessageResponse('success', $data);
    }

    // card orders api

    public function cardOrders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'riderID' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $commission = Setting::where('name', 'commission')->first();
        $data['user'] = (new User())->getUserDetails($request, Auth::user()->id);
        $data['cash_orders_today'] = Order::where('rider_id', $request->riderID)->where('order_status', 'completed')->where('payment_method', 'cash')->whereDate('created_at', '=', date('Y-m-d', strtotime($request->date)))->count('id');
        $data['cash_orders_commission'] = Order::where('rider_id', $request->riderID)->where('order_status', 'completed')->where('payment_method', 'cash')->whereDate('created_at', '=', date('Y-m-d', strtotime($request->date)))->sum('delivery_cost');
        $data['balanceTo_porter'] = round($data['cash_orders_commission'] / 100 * $commission->value, 2);
        $data['total'] = round($data['cash_orders_commission'] - $data['balanceTo_porter'], 2);        
        $data['records'] = (new User())->getCardPaymentHistory($request, Auth::user()->id);

        if ($data['records'] == null) {
            return $this->apiErrorMessageResponse('No Record Found!');
        }
   
        // $result = GetCashOrderHistory::collection($data)->toArray($request);    
        return $this->apiSuccessMessageResponse('success', $data);
    }

    public function newOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'riderID' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $record = Order::where('rider_id', $request->riderID)->where('order_status', 'pending')->first();         
        $result = (new GetOrderItems($record))->resolve();    
        return $this->apiSuccessMessageResponse('success', $result  );
    }

    public function updateRiderLocation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'userID' => 'required',           
            'latitude' => 'required',           
            'longitude' => 'required',           
             ]);
         if ($validator->fails()) {
                return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
            }
        $userID = $request->userID;
        $data = User::find($userID);
        $data->latitude = $request->latitude;
        $data->longitude = $request->longitude;
        $data->save();

        if($data instanceof \App\User ) {
            return $this->apiSuccessMessageResponse('Success', ['latitude' => $data->latitude, 'longitude' => $data->longitude]);
        }
    }

    public function getWalletBalance(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'riderID' => 'required|exists:users,id'           
           ]);

        if ($validator->fails()) {
               return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
           }
        $riderID = $request->riderID;
        $data = Wallet::with('rider:id,name')->where('rider_id', $riderID)->select('id', 'rider_id', 'balance')->first();
        
        if($data) {
            return $this->apiSuccessMessageResponse('Success', $data);
        } else {
            return response()->json([
                'status' => '0',
                'message' => ' No Record Found', 
                'data'   => []
                ]);
        }
    }
    
    public function getWithdraw(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'walletID' => 'required|exists:wallet,id'           
           ]);

        if ($validator->fails()) {
               return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
           }

        $walletID = $request->walletID;
       
        $total = $data->withdrawn + $request->amount;             
        
        $data->withdrawn = $total;
        $data->balance = $data->balance - $request->amount;
        $data->save();

        $record                     = new WalletHistory();
        $record->wallet_id          = $data->id;
        $record->rider_id           = $data->rider_id;
        $record->withdraw_amount    = $request->amount;
        $record->date               = now();
        $record->save();

        if($data instanceof \App\Wallet ) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }
}
