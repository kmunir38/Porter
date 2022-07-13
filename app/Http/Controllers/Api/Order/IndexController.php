<?php

namespace App\Http\Controllers\Api\Order;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Role;
use App\Http\Resources\Frontend\Order\PastOrder as ViewPastOrder;
use App\Http\Resources\Frontend\Order\ViewOrder as ViewOrderDetail;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;
use App\Http\Resources\Frontend\Order\Getlatest as GetLatestOrder;
use App\Http\Resources\Frontend\Order\AcceptOrderRes as GetAcceptOrderRes;
use App\Http\Resources\Frontend\Order\GetDetails as GetPaymentDetails;
use App\Order;
use App\OrderItem;
use App\CancelOrder;
use App\Item;
use App\User;
use App\Notification;
use App\Setting;
use App\Address;
use App\Wallet;
use App\WalletItem;
use App\WalletTransactions;
use Auth;
use DB;
use Fasodev\Sdk\Config\TransactionData;
use Fasodev\Sdk\Exception\TransactionException;
use Fasodev\Sdk\OrangeMoneyAPI;
use Fasodev\Sdk\PaymentSDK;

class IndexController extends Controller
{
    use ApiResponse;
    
    public function store(Request $request)
    { 
        $validator = Validator::make($request->all(), [
            'restaurant_id'     => 'required_if:grocery_id, ==, ""',
            'grocery_id'        => 'required_if:restaurant_id, ==, ""',
            'card_id'           => 'nullable|exists:cards,id',
            'address_id'        => 'nullable|exists:addresses,id',
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }  

        $vat = Setting::where('name', 'vat')->first();  
        $order = new Order();
        $order->customer_id = \Auth::user()->id;
        $order->restaurant_id = $request->restaurant_id;
        $order->grocery_id = $request->grocery_id;
        $order->shopper_id = $request->shopper_id;
        $order->order_status = 'pending';
        $order->payment_method = $request->payment_method;
        $order->card_id = $request->card_id;
        $order->address_id = $request->address_id;
        $order->discount = $request->discount;
        $order->vat_amount = $request->vat_amount;
        $order->vat = $vat->value;
        $order->delivery_cost = $request->delivery_cost;
        $order->distance = $request->distance;
        $order->note = $request->note;
        $order->grand_total = 00;
        $order->save();
        
        $grand_total = 0;
        $total = 0;

        foreach($request->item as $t) {

            $item = Item::where('id', $t)->first();
            $discounted = $item->price / 100 * $item->discount;
            if($item->end_date < date(strtotime(now()))){
                $itemPrice = $item->price - $discounted;
            } else {
                $itemPrice = $item->price;
            }
            $total += $itemPrice * $t['qty'];
            $grand_total = $total + $request->delivery_cost + $request->vat_amount;
           
            if($order){
                $record             = new OrderItem();
                $record->item_id    = $t['id'];
                $record->order_id   = $order->id;
                $record->price      = $item->price;
                $record->sub_total  = $item->price * $t['qty'];                
                $record->qty        = $t['qty'];
                $record->save();
            }
            
            // $order->order_items()->attach('order_id', 
            //     [
            //       'item_id'      => $t, 
            //       'price'        => $item->price,
            //       'sub_total'    => $item->price * $request->qty
            //     ]);
        }
        $order->sub_total   = $total;                   
        $order->grand_total = $grand_total;
        $order->save();
        
        if($request->payment_method == 'wallet' && Auth::user()->wallet < $grand_total) {
            $order->payment_status = 'failed';
            $order->order_status = 'cancelled';
            $order->save();
        } elseif($request->payment_method == 'wallet' && Auth::user()->wallet >= $grand_total) {
            $order->payment_status = 'completed';
			$order->save();
			
			$user = Auth::user();
			$user->wallet -= $grand_total;
			$user->save();
			
			if($order->restaurant_id){
                $vendorToken = User::find($order->restaurant_id);   
                $device_token = $vendorToken->device_token;
    
                // dd($shopper_token);
                if ($device_token) {            
                    $notification = new Notification;
                    $message2 = "You Have A New Order";
                    $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
                }
            }
            if($order->grocery_id){
                $shopperToken = User::where('assigned_grocery', $order->grocery_id)->first();                
                $groceryToken = User::where('id', $order->grocery_id)->first();
                
                $shopper_token = $shopperToken->device_token;
                $grocery_token = $groceryToken->device_token;
    
                if ($grocery_token) {            
                    $notification = new Notification;
                    $message2 = "You Have A New Order";
                    $notification->sendPushNotification($grocery_token, 'Porter', $message2, '', 'new_order', $order->id);
                }
    
                if ($shopper_token) {            
                    $notification = new Notification;
                    $message2 = "You Have A New Order";
                    $notification->sendPushNotification($shopper_token, 'Porter', $message2, '', 'new_order', $order->id);
                }
            }    
        }
        
        // if($request->restaurant_id){
        //     $vendorToken = User::find($order->restaurant_id);   
        //     $device_token = $vendorToken->device_token;

        //     // dd($shopper_token);
        //     if ($device_token) {            
        //         $notification = new Notification;
        //         $message2 = "You Have A New Order";
        //         $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
        //     }
        // }
        // if($request->grocery_id){
        //     $shopperToken = User::where('assigned_grocery', $order->grocery_id)->first();                
        //     $groceryToken = User::where('id', $order->grocery_id)->first();
            
        //     $shopper_token = $shopperToken->device_token;
        //     $grocery_token = $groceryToken->device_token;

        //     if ($grocery_token) {            
        //         $notification = new Notification;
        //         $message2 = "You Have A New Order";
        //         $notification->sendPushNotification($grocery_token, 'Porter', $message2, '', 'new_order', $order->id);
        //     }

        //     if ($shopper_token) {            
        //         $notification = new Notification;
        //         $message2 = "You Have A New Order";
        //         $notification->sendPushNotification($shopper_token, 'Porter', $message2, '', 'new_order', $order->id);
        //     }
        // }
        
        if ($order instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $order);
        }
    }
    
    public function converter($amount)
    {
        $req_url = 'https://api.exchangerate.host/latest?symbols=XOF&base=USD&amount='.$amount;
        $response_json = file_get_contents($req_url);
        if(false !== $response_json) {
            try {
                $response = json_decode($response_json);
                if($response->success === true) {
                    return number_format($response->rates->XOF, 2, '.', '');
                    // var_dump($response);
                }
            } catch(Exception $e) {
                // Handle JSON parse error...
            }
        }  
    }
    
    public function orangeMoney($order_id)
    {
        try {
            //                                 Login Id       Password      
            $orangeApi = (new OrangeMoneyAPI("SUPREMESARL", "Orange@123", "64926823"))
                        ->withTransactionData(TransactionData::from('64926314', '100', '121212'))
                        ->withCustomReference("123456778") //optionnal
                        ->useProdApi() // for production
                        ->withoutSSLVerification() //if you have any troubleshoot with ssl verifcation(not recommended)
            ;
            $response = (new PaymentSDK($orangeApi))->handlePayment();
            echo 'Thank you for your purchasse !';
            echo $response->getTransactionId();
        } catch (TransactionException $exception) {
            echo "Whoops! Unable to process payment. <br/> 
                  Error message returned by request: {$exception->getMessage()}. <br/>
                  Error code returned by request: {$exception->getCode()}";
        }
    }
    
    public function ligdiCash($order_id)
    {
        if(env('LIVE_MODE') == 1) {
            $api_key = env('API_KEY');
            $authorization = env('AUTHORIZATION');
        } else {
            $api_key = env('TEST_API_KEY');
            $authorization = env('TEST_AUTHORIZATION');
        }
        
        $order = Order::find($order_id);
        // $amount = $order->grand_total;
        
        $amount = $this->converter($order->grand_total);
        if($amount < 100) {
            abort(404);
        }
        
        $curl = curl_init();

        curl_setopt_array($curl, array(
          CURLOPT_URL => "https://app.ligdicash.com/pay/v01/redirect/checkout-invoice/create",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_SSL_VERIFYHOST => false,
          CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 0,
          CURLOPT_FOLLOWLOCATION => true,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_HTTPHEADER => array(
            "Apikey: " . $api_key,
            "Authorization: Bearer " . $authorization,
            "Accept: application/json",
            "Content-Type: application/json"
          ),
        // CURLOPT_HTTPHEADER => array(
        //     "Apikey: YNYZ3BXIFWRBBPFQ2",
        //     "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9hcHAiOiI3NzQiLCJpZF9hYm9ubmUiOiI4OTk0MiIsImRhdGVjcmVhdGlvbl9hcHAiOiIyMDIxLTA4LTE4IDE4OjIwOjQyIn0.8rMinJMEDZeeoGNqcKxwD2VjXPC5t1__ilTJIOwFtQ4",
        //     "Accept: application/json",
        //     "Content-Type: application/json"
        //   ),
          CURLOPT_POSTFIELDS =>'
        					  {
        					  "commande": {
        						"invoice": {
        						  "items": [
        							{
        							  "name": "Nom de article ou service ou produits",
        							  "description": "Description du service ou produits",
        							  "quantity": 1,
        							  "unit_price": "'.$amount.'",
        							  "total_price": "'.$amount.'"
        							}
        						  ],
        						  "total_amount": "'.$amount.'",
        						  "devise": "XOF",
        						  "description": "Descrion de la commande des produits ou services",
        						  "customer": "",
        						  "customer_firstname":"Prenom du client",
        						  "customer_lastname":"Nom du client",
        						  "customer_email":"tester@ligdicash.com"
        						},
        						"store": {
        						  "name": "PORTER DELIVERY",
        						  "website_url": "http://porter.reignsol.net"
        						},
        						"actions": {
        						  "cancel_url": "http://porter.reignsol.net",
        						  "return_url": "http://porter.reignsol.net/api/v1/customer/ligdi-callback",
        						  "callback_url": "http://porter.reignsol.net/api/v1/customer/ligdi-callback"
        						},
        						"custom_data": {
        						  "transaction_id": "'. $order_id .'" 
        						}
        					  }
        					}',
        ));
        
        $response = json_decode(curl_exec($curl));
        
        curl_close($curl);
        
        return redirect($response->response_text);
    }
    
    public function ligdiCallback(Request $request)
    {
        if(env('LIVE_MODE') == 1) {
            $api_key = env('API_KEY');
            $authorization = env('AUTHORIZATION');
        } else {
            $api_key = env('TEST_API_KEY');
            $authorization = env('TEST_AUTHORIZATION');
        }
        
        $invoiceToken = $request->token;
        $curl = curl_init();

        curl_setopt_array($curl, array(
          CURLOPT_URL => "https://app.ligdicash.com/pay/v01/redirect/checkout-invoice/confirm/?invoiceToken=".$invoiceToken,
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_SSL_VERIFYHOST => false,
          CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_FOLLOWLOCATION => true,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "GET",
          CURLOPT_HTTPHEADER => array(
            "Apikey: " . $api_key,
            "Authorization: Bearer " . $authorization
          ),
        // CURLOPT_HTTPHEADER => array(
        //     "Apikey: YNYZ3BXIFWRBBPFQ2",
        //     "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9hcHAiOiI3NzQiLCJpZF9hYm9ubmUiOiI4OTk0MiIsImRhdGVjcmVhdGlvbl9hcHAiOiIyMDIxLTA4LTE4IDE4OjIwOjQyIn0.8rMinJMEDZeeoGNqcKxwD2VjXPC5t1__ilTJIOwFtQ4"
        //   ),
        ));
        $response = json_decode(curl_exec($curl));
        curl_close($curl);
        
        if(isset($response) && isset($response->external_id)) {
            $order = Order::find($response->external_id);
    		if(trim($response->status)=="completed") {
    			$order->payment_status = 'completed';
    			$order->save();
    			
    			if($order->restaurant_id){
                    $vendorToken = User::find($order->restaurant_id);   
                    $device_token = $vendorToken->device_token;
        
                    // dd($shopper_token);
                    if ($device_token) {            
                        $notification = new Notification;
                        $message2 = "You Have A New Order";
                        $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
                    }
                }
                if($order->grocery_id){
                    $shopperToken = User::where('assigned_grocery', $order->grocery_id)->first();                
                    $groceryToken = User::where('id', $order->grocery_id)->first();
                    
                    $shopper_token = $shopperToken->device_token;
                    $grocery_token = $groceryToken->device_token;
        
                    if ($grocery_token) {            
                        $notification = new Notification;
                        $message2 = "You Have A New Order";
                        $notification->sendPushNotification($grocery_token, 'Porter', $message2, '', 'new_order', $order->id);
                    }
        
                    if ($shopper_token) {            
                        $notification = new Notification;
                        $message2 = "You Have A New Order";
                        $notification->sendPushNotification($shopper_token, 'Porter', $message2, '', 'new_order', $order->id);
                    }
                }
    			return redirect()->route('callback-success');
    		} else {
    		    $order->payment_status = 'failed';
    			$order->save();
    			
        		return redirect()->route('callback-failure');
            }
        }else{
    		return redirect()->route('callback-failure');
        }
    }
    
    public function ligdiCashWallet($user_id, $amount)
    {
        if(env('LIVE_MODE') == 1) {
            $api_key = env('API_KEY');
            $authorization = env('AUTHORIZATION');
        } else {
            $api_key = env('TEST_API_KEY');
            $authorization = env('TEST_AUTHORIZATION');
        }
        
        $user = User::find($user_id);
        
        
        $amount = $this->converter($amount);
        
        if(!$user || $amount < 100) {
            abort(404);
        }
        // $amount = $order->grand_total;
        // $amount = 100;
        $curl = curl_init();

        curl_setopt_array($curl, array(
          CURLOPT_URL => "https://app.ligdicash.com/pay/v01/redirect/checkout-invoice/create",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_SSL_VERIFYHOST => false,
          CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 0,
          CURLOPT_FOLLOWLOCATION => true,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_HTTPHEADER => array(
            "Apikey: " . $api_key,
            "Authorization: Bearer " . $authorization,
            "Accept: application/json",
            "Content-Type: application/json"
          ),
        // CURLOPT_HTTPHEADER => array(
        //     "Apikey: YNYZ3BXIFWRBBPFQ2",
        //     "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9hcHAiOiI3NzQiLCJpZF9hYm9ubmUiOiI4OTk0MiIsImRhdGVjcmVhdGlvbl9hcHAiOiIyMDIxLTA4LTE4IDE4OjIwOjQyIn0.8rMinJMEDZeeoGNqcKxwD2VjXPC5t1__ilTJIOwFtQ4",
        //     "Accept: application/json",
        //     "Content-Type: application/json"
        //   ),
          CURLOPT_POSTFIELDS =>'
        					  {
        					  "commande": {
        						"invoice": {
        						  "items": [
        							{
        							  "name": "Nom de article ou service ou produits",
        							  "description": "Description du service ou produits",
        							  "quantity": 1,
        							  "unit_price": "'.$amount.'",
        							  "total_price": "'.$amount.'"
        							}
        						  ],
        						  "total_amount": "'.$amount.'",
        						  "devise": "XOF",
        						  "description": "Descrion de la commande des produits ou services",
        						  "customer": "",
        						  "customer_firstname":"Prenom du client",
        						  "customer_lastname":"Nom du client",
        						  "customer_email":"tester@ligdicash.com"
        						},
        						"store": {
        						  "name": "PORTER DELIVERY",
        						  "website_url": "http://porter.reignsol.net"
        						},
        						"actions": {
        						  "cancel_url": "http://porter.reignsol.net",
        						  "return_url": "http://porter.reignsol.net/api/v1/customer/ligdi-wallet-callback",
        						  "callback_url": "http://porter.reignsol.net/api/v1/customer/ligdi-wallet-callback"
        						},
        						"custom_data": {
        						  "transaction_id": "'. $user_id .'" 
        						}
        					  }
        					}',
        ));
        
        $response = json_decode(curl_exec($curl));
        
        curl_close($curl);
        
        return redirect($response->response_text);
    }
    
    public function ligdiCallbackWallet(Request $request)
    {
        if(env('LIVE_MODE') == 1) {
            $api_key = env('API_KEY');
            $authorization = env('AUTHORIZATION');
        } else {
            $api_key = env('TEST_API_KEY');
            $authorization = env('TEST_AUTHORIZATION');
        }
        
        $invoiceToken = $request->token;
        $curl = curl_init();

        curl_setopt_array($curl, array(
          CURLOPT_URL => "https://app.ligdicash.com/pay/v01/redirect/checkout-invoice/confirm/?invoiceToken=".$invoiceToken,
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_SSL_VERIFYHOST => false,
          CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_FOLLOWLOCATION => true,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "GET",
          CURLOPT_HTTPHEADER => array(
            "Apikey: " . $api_key,
            "Authorization: Bearer " . $authorization
          ),
        // CURLOPT_HTTPHEADER => array(
        //     "Apikey: YNYZ3BXIFWRBBPFQ2",
        //     "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9hcHAiOiI3NzQiLCJpZF9hYm9ubmUiOiI4OTk0MiIsImRhdGVjcmVhdGlvbl9hcHAiOiIyMDIxLTA4LTE4IDE4OjIwOjQyIn0.8rMinJMEDZeeoGNqcKxwD2VjXPC5t1__ilTJIOwFtQ4"
        //   ),
        ));
        $response = json_decode(curl_exec($curl));
        curl_close($curl);
        
        if(isset($response) && isset($response->external_id)) {
            // dd($response);
            $user = User::find($response->external_id);
            $amount = $response->montant;
    		if(trim($response->status)=="completed") {
    			$user->wallet += $amount;
    			$user->save();
    			
    			$transaction = new WalletTransactions();
    			$transaction->user_id = $user->id;
    			$transaction->amount = $amount;
    			$transaction->status = 'paid';
    			$transaction->save();
    			
    			if($user){
                    // $vendorToken = User::find($order->restaurant_id);   
                    $device_token = $user->device_token;
        
                    // dd($shopper_token);
                    if ($device_token) {            
                        $notification = new Notification;
                        $message2 = "Your wallet has been credited successfully!";
                        $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'wallet_topup', $user->id);
                    }
                }
    			return redirect()->route('callback-success');
    		} else {
        		return redirect()->route('callback-failure');
            }
        }else{
    		return redirect()->route('callback-failure');
        }
    }

    public function assignOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'orderID'     => 'required|exists:orders,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }  
        $radius = 5;   

        $order = Order::where('id', $request->orderID)->first();
        $vendor = User::where('id', $order->restaurant_id)
        ->orWhere('id', $order->grocery_id)
        ->orWhere('id', $order->shopper_id)->first();
         $rider = User::role('rider')->whereDoesnthave('cancel_orders')->where('onlineStatus', 1)->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$vendor->latitude, $vendor->longitude, $vendor->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        if(!$rider){
             return response()->json([
            'status' => 0,
            'message' => 'No rider Available at this time',
            'data' => []
            ]);
        } 

        $order->order_status   = 'finding_rider';
        // $order->rider_id = $rider->id;
        $order->rider_id = 155;
        $order->save();
        $vendorToken = User::find($order->rider_id);
       
        $device_token = $vendorToken->device_token;
        if ($device_token) {            
            $notification = new Notification;
            $message2 = "You have a new order!";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'new_order', $order->id);
        }
        if ($order instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $order);
        }
    }

    public function acceptOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id'        => 'exists:orders,id|nullable',  
            'restaurant_id'   => 'exists:users,id|nullable',
            'shopper_id'      => 'exists:users,id|nullable',
            'rider_id'        => 'exists:users,id|nullable',     
            'grocery_id'      => 'exists:users,id|nullable'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        
        $order = Order::where('id', $request->order_id)->first();
        $user = User::where('id', $request->restaurant_id)->first();
        $address = Address::where('id', $order->address_id)->first();
        
        $id = $request->order_id;
        $data  = Order::find($id);

        
        $latitude   = $address->latitude;
        $longitude  = $address->longitude;
        
        
        $record = User::where('id', $data->restaurant_id)
        ->orWhere('id', $data->grocery_id)
        ->orWhere('id', $data->shopper_id)
        ->selectRaw('*, ( 6367 * acos( cos( radians( ? ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( ? ) ) + sin( radians( ? ) ) * sin( radians( latitude ) ) ) ) AS distance', [$latitude, $longitude, $latitude])
        ->having('distance', '<', 30)
        ->orderBy('distance')
        ->first();

        $cost = Setting::where('name', 'delivery_cost')->first();                 
        $result = $record->distance * $cost->value;
        if($request->restaurant_id){
        $data->restaurant_id    = $request->restaurant_id;
        $data->order_status     = 'preparing'; 
        }
        if($request->shopper_id){
        $data->shopper_id       = $request->shopper_id;
        $data->order_status     = 'preparing'; 
        }
        if($request->rider_id){
        $data->rider_id         = $request->rider_id;
        $data->order_status     = 'rider_accepted'; 

        }
        if($request->grocery_id){
        $data->grocery_id       = $request->grocery_id;
        $data->order_status     = 'preparing'; 
        }

        // $data->delivery_cost    = round($result,2);
        if($request->restaurant_id){
            $data->accepted_at_vendor = now();
        }
        if($request->restaurant_id){
            $data->accepted_at_rider = now();
        }

        $data->save();

        $customerToken = User::find($order->customer_id); 
        if($order->rider_id){
            if($order->restaurant_id){
                $vendorToken = User::find($order->restaurant_id);   
            }
            if($order->grocery_id){
                // $vendorToken = User::find($order->grocery_id);   
                $vendorToken = User::where('assigned_grocery',$order->grocery_id)->first();   
            }
            $d_token = $vendorToken->device_token;
            if ($d_token) {            
                $notification = new Notification;
                $message2 = "Rider found and on the way!";
                $notification->sendPushNotification($d_token, 'Porter', $message2, '', 'order_accepted', $order->id);
            }
        } else {   
            $device_token = $customerToken->device_token;
            if ($device_token) {
                
                $notification = new Notification;
                $message2 = "Your Order has been accepted and in process";
                $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'order_accepted', $order->id);
            }
        }
        

        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function readyOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id'   => 'exists:users,id|nullable',            
            'order_id'        => 'required|exists:orders,id|nullable',            
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $id = $request->order_id;
        $data  = Order::find($id);

        $data->order_status   = 'ready';
        $data->completed_at_vendor   = now();
        $data->save();
        
        if($data->restaurant_id){
            $customerToken = User::find($data->customer_id);   
            $device_token = $customerToken->device_token;
            if ($device_token) {
                
                $notification = new Notification;
                $message2 = "Your Order has been prepared and searching for rider";
                $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'order_ready', $data->id);
            }
        }
        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }
    
    public function riderPickOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [                        
            'order_id'        => 'required|exists:orders,id|nullable',            
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $id = $request->order_id;
        $data  = Order::find($id);

        $data->order_status  = 'picked';
        $data->save();
        
        $customerToken = User::find($data->customer_id);
        $device_token = $customerToken->device_token;
        
        if ($device_token) {            
            $notification = new Notification;
            $message2 = "Rider has picked up your order and on the way!";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'order_picked', $data->id);
        }

        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }
    
    public function paymentProceed(Request $request)
    {
        $validator = Validator::make($request->all(), [                        
            'orderID'        => 'required|exists:orders,id'            
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $data  = Order::find($request->orderID);
        if($request->type == 'shopper'){
            $data->confirm_payment_proceed = 0;
            $data->save();
        } elseif($request->type == 'grocery'){
            $data->confirm_payment_proceed = 1;
            $data->save();
        }
        if($request->type == 'shopper'){
            
            $vendorToken = User::find($data->grocery_id);        
            $device_token = $vendorToken->device_token;
            if($device_token) {
                $notification = new Notification();
                $message2 = "Please confirm payment for Order No. ". $data->id . "";
                $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'payment_confirmation', $data->id);
            }    
        }

        if($request->type == 'grocery'){
            $grocery = User::find($data->grocery_id);
            $vendorToken = User::where('assigned_grocery', $grocery->id)->first(); 

            $device_token = $vendorToken->device_token;
            if($device_token) {
                $notification = new Notification();
                $message2 = "Payment confirmed for Order No. ". $data->id . ". Please proceed to continue";
                $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'payment_confirmation', $data->id);
            }    
        }
    }

    public function completeOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id'   => 'exists:users,id|nullable',
            'shopper_id'      => 'exists:users,id|nullable',
            'rider_id'        => 'exists:users,id|nullable',     
            'grocery_id'      => 'exists:users,id|nullable'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $setting = Setting::where('name', 'commission')->first();

        $id = $request->order_id;
        if($request->vendor_id){

        $data  = Order::where('id', $id)        
        ->where('restaurant_id', $request->vendor_id)
        ->orwhere('grocery_id', $request->vendor_id)
        ->orwhere('shopper_id', $request->vendor_id) 
        ->first();

        } elseif($request->rider_id) {

        $data  = Order::where('id', $id)
        ->where('rider_id', $request->rider_id)
        ->first();             
        }

        if($request->rider_id){
            $data->order_status     = 'completed';
            $data->completed_at_rider   = now();

        } else {
            $data->order_status     = 'dispatch';
            $data->completed_at_vendor   = now();            
        }
        
        $data->save();

        $finding = Wallet::where('rider_id', $data->rider_id)->first();

        if($finding == NULL){
            $commission = new Wallet();
            $commission->rider_id  = $data->rider_id;
            $commission->balance    = 0;
            $commission->save();

            $getWallet = Wallet::where('rider_id', $data->rider_id)->first();
            $getCommission = $data->delivery_cost - $data->delivery_cost / 100 * $setting->value ;
            // dd($getCommission);
            $commissionItem = new WalletItem();
            $commissionItem->wallet_id      = $commission->id;
            $commissionItem->order_id       = $data->id;
            $commissionItem->order_amount   = $data->grand_total;
            $commissionItem->commission     = $getCommission;
            $commissionItem->save();

            $total = WalletItem::where('wallet_id', $commissionItem->wallet_id)->groupBy('wallet_id')->sum('commission');    

            $commission->balance    = $total;
            $commission->save();

        } else {    

            $commission = Wallet::where('rider_id', $data->rider_id)->first();

            $getWallet = Wallet::where('rider_id', $data->rider_id)->first();
            $getCommission = $data->delivery_cost - $data->delivery_cost / 100 * $setting->value ;
            // dd($getCommission);
            $commissionItem = new WalletItem();
            $commissionItem->wallet_id      = $getWallet->id;
            $commissionItem->order_id       = $data->id;
            $commissionItem->order_amount   = $data->grand_total;
            $commissionItem->commission     = $getCommission;
            $commissionItem->save();

            $total = WalletItem::where('wallet_id', $commissionItem->wallet_id)->groupBy('wallet_id')->sum('commission');    

            $commission->balance   = $total;
            $commission->save();
        }
        // customer notification
        $customerToken = User::find($data->customer_id);           
        $device_token = $customerToken->device_token;
        
        if ($device_token) {            
            $notification = new Notification;
            $message2 = "Your Order has been delivered successfully!";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'order_delivered', $data->id);
        }

        // vendor notification
        if($data->restaurant_id){
            $vendorToken = User::find($data->restaurant_id);           
        }
        if($data->grocery_id){
            $vendorToken = User::find($data->grocery_id);           
        }
        $d_token = $vendorToken->device_token;
        
        if ($d_token) {            
            $notification = new Notification;
            $message2 = "Your Order #" . $data->id . " has been dispatched successfully!";
            $notification->sendPushNotification($d_token, 'Porter', $message2, '', 'order_delivered', $data->id);
        }

        // rider notification
        $riderToken = User::find($data->rider_id);           
        $de_token = $riderToken->device_token;
        
        if ($de_token) {            
            $notification = new Notification;
            $message2 = "Your order has been completed successfully!";
            $notification->sendPushNotification($de_token, 'Porter', $message2, '', 'order_delivered', $data->id);
        }

        if ($data instanceof \App\Order) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function rejectOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id'     => 'required|exists:orders,id',
            'cancel_by'     => 'required|exists:users,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }  
        $data                   = new CancelOrder();
        $data->order_id         = $request->order_id;
        $data->cancel_by        = $request->cancel_by;
        $data->cancel_at        = now();
        $data->save();

        $record = Order::where('id', $request->order_id)->first();
        if(Auth::user()->user_role == 'customer')
        {
            $record->order_status = 'cancelled';
            $record->save();
        } 
        if(Auth::user()->user_role == 'grocery' || Auth::user()->user_role == 'restaurant')
        {
            $record->order_status = 'cancelled';
            $record->save();

        } elseif(Auth::user()->user_role == 'rider') { 
            // $radius = 5;   
            // $vendor = User::where('id', $record->restaurant_id)->first();
            // $riders = User::role('rider')->where('onlineStatus', 1)->select('*')
            //     ->selectRaw('( 6371 * acos( cos( radians(?) ) *
            //                       cos( radians( latitude ) )
            //                       * cos( radians( longitude ) - radians(?)
            //                       ) + sin( radians(?) ) *
            //                       sin( radians( latitude ) ) )
            //                      ) AS distance', [$vendor->latitude, $vendor->longitude, $vendor->latitude])
            //     ->havingRaw("distance < ?", [$radius])
            //     ->first();
            
            // $orderCancellation = CancelOrder::where('order_id', $request->order_id)->count('order_id');
            
            // if($orderCancellation == 5){
            //     return response()->json([
            //     'status' => 0,
            //     'message' => 'No rider found at this time',
            //     'data' => []
            //     ]);
            // }
                
            // $cancelled = CancelOrder::where('order_id', $record->id)->where('cancel_by', $riders->id)->first();
            // if($cancelled){
            //     $cancellOrder = $cancelled->cancel_by;
            // } else {
            //     $cancellOrder = 0;
            // }

            // $rider = User::role('rider')->where('onlineStatus', 1)->where('id', '!=' ,$cancellOrder)->select('*')
            //     ->selectRaw('( 6371 * acos( cos( radians(?) ) *
            //                       cos( radians( latitude ) )
            //                       * cos( radians( longitude ) - radians(?)
            //                       ) + sin( radians(?) ) *
            //                       sin( radians( latitude ) ) )
            //                      ) AS distance', [$vendor->latitude, $vendor->longitude, $vendor->latitude])
            //     ->havingRaw("distance < ?", [$radius])
            //     ->first();
            $record->rider_id = 112;  
            $record->save();
        }          

        // notification to customer
        $customerToken = User::find($record->customer_id);           
        $device_token = $customerToken->device_token;
        
        if ($device_token) {            
            $notification = new Notification;
            $message2 = "We are sorry your order has been cancelled.";
            $notification->sendPushNotification($device_token, 'Porter', $message2, '', 'order_cancelled', $record->id);
        }

        if ($data instanceof \App\CancelOrder) {
            return $this->apiSuccessMessageResponse('Success', $data);
        }
    }

    public function pastOrders(Request $request)
    {
        if($request->vendorID){
        $data = Order::where('restaurant_id',  $request->vendorID)->where('order_status', 'completed')
        ->orWhere('grocery_id',  $request->vendorID)->where('order_status', 'completed')
        ->orWhere('shopper_id',  $request->vendorID)->where('order_status', 'completed')
        ->latest()->get();
        }
        if($request->riderID){
        $data = Order::where('rider_id',  $request->riderID)->where('order_status', 'completed')->latest()->get();
        }
        if($request->customerID){
        $data = Order::where('customer_id',  $request->customerID)->latest()->get();
        }
        // return $data;
        $result = ViewPastOrder::collection($data)->toArray($request);    

         if (count($data) > 0) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function newOrders(Request $request)
    {        
        $items = Order::where(function($q) use($request) {
            $q->where('restaurant_id', $request->vendorID)
            ->orWhere('grocery_id', $request->vendorID)
            ->orWhere('shopper_id', $request->vendorID)
            ->orWhere('rider_id', $request->vendorID);
        })
        ->whereIn('order_status', ['pending', 'preparing', 'ready', 'rider_accepted', 'finding_rider'])
        ->latest()->get();            
        
        $result = ViewPastOrder::collection($items)->toArray($request);    
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

    public function singleOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id'     => 'required|exists:orders,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $data = Order::where('id', $request->id)->first();
        $result = (new ViewOrderDetail($data))->resolve();
         if ($data) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }
    
    public function orderDetailToRider(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'orderID'     => 'required|exists:orders,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $radius = 10;
        $vendor = User::where('id', $request->vendorID)->first();
     
        $data['order'] = Order::where('id', $request->orderID)->first();                
        // return $data;
        if($data['order'] == NULL){
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
            ]);
        }
        // items object
        $data['order_items'] = DB::table('items')->where('order_id', $data['order']->id)->join('order_items', 'items.id', '=' ,'order_items.item_id')
        ->select('order_items.*', 'items.name')->get();
        
        // vendor object
        if($request->vendorID){      
        $data['vendor'] = User::where('id', $request->vendorID)->first();
        
        } else {

        $data['vendor'] = User::where('id', $data['order']->restaurant_id)->orWhere('id', $data['order']->grocery_id)->orWhere('id', $data['order']->shopper_id)->first();           
        }
        $data['rider'] = User::where('id', $data['order']->rider_id)
            ->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$data['vendor']->latitude, $data['vendor']->longitude, $data['vendor']->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        // custoemr object
        
        if($data['order']->customer->latitude == NULL){
            $data['customer'] = User::where('id', $data['order']->customer_id)
            ->select('*')
            ->first();    
        } else {
            $data['customer'] = User::where('id', $data['order']->customer_id)
            ->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$data['vendor']->latitude, $data['vendor']->longitude, $data['vendor']->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        }
        
        $data['customerOrder_address'] = Address::where('id', $data['order']->address_id)
        ->select('id', 'user_id', 'address', 'latitude', 'longitude')
        ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$data['vendor']->latitude, $data['vendor']->longitude, $data['vendor']->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        if ($data == NULL) {            
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        } else {
            // $result =  (new GetLatestOrder($data))->resolve() ;
            return $this->apiSuccessMessageResponse('success', $data);
        }         
    }

    public function getALLOrderITems(Request $request)
    {
        $order = OrderItem::get();
        $result = GetOrderItems::collection($order)->toArray($request);
        return $result;
    }

    public function getOrderView(Request $request)
    {
        $radius = 10;
        $vendor = User::where('id', $request->vendorID)->first();

        if($request->rider_id){
            $data['order'] = Order::with('itemsOrder')->where('order_status', 'finding_rider')
                ->whereDoesnthave('cancel_orders', function($q) use($request){
                    $q->where('cancel_by', $request->rider_id);
                    })
                ->where('rider_id', $request->rider_id)            
                ->latest()
                ->first();    
        } 
        
        if($request->vendorID) {
            $data['order'] = Order::with('itemsOrder')->where('order_status',  'pending')
                ->whereDoesnthave('cancel_orders', function($q) use($request){
                    $q->where('cancel_by', $request->vendorID);
                    })
                ->where(function($q) use($request) {
                    $q->where('restaurant_id', $request->vendorID)
                    ->orWhere('grocery_id', $request->vendorID)
                    ->orWhere('shopper_id', $request->vendorID);
                })
                ->latest()
                ->first();                
        }
     
        if($data['order'] == NULL){
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
            ]);
        }
        // return $date['order']->customer_id;
        if($request->vendorID){      
            $data['vendor'] = User::where('id', $request->vendorID)->first();
        
        } else {
    
            $data['vendor'] = User::where('id', $data['order']->restaurant_id)->orWhere('id', $data['order']->grocery_id)->orWhere('id', $data['order']->shopper_id)->first();           
        }
        $data['rider'] = User::where('id', $data['order']->rider_id)
            ->select('*')
            ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                              cos( radians( latitude ) )
                              * cos( radians( longitude ) - radians(?)
                              ) + sin( radians(?) ) *
                              sin( radians( latitude ) ) )
                             ) AS distance', [$data['vendor']->latitude, $data['vendor']->longitude, $data['vendor']->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();
        // dd($data['rider']);

        $data['customer'] = User::where('id', $data['order']->customer_id)
            ->select('*')
            
            ->first();
        
        $data['customerOrder_address'] = Address::where('id', $data['order']->address_id)
        ->select('id', 'user_id', 'address', 'latitude', 'longitude')
        ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$data['vendor']->latitude, $data['vendor']->longitude, $data['vendor']->latitude])
            ->havingRaw("distance < ?", [$radius])
            ->first();

        if ($data == NULL) {            
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        } else {
            // $result =  (new GetLatestOrder($data))->resolve() ;
            return $this->apiSuccessMessageResponse('success', $data);
        }         
    }
    
    public function getOrderPaymentDetails(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'vendorID'     => 'required|exists:users,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $vendor = Order::where('order_status', 'completed')->where('restaurant_id', $request->vendorID)
            ->orWhere('grocery_id', $request->vendorID)
            ->orWhere('shopper_id', $request->vendorID)
            ->latest()->get();

        if(count($vendor) < 1){
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
            ]);
        }
        $result = GetPaymentDetails::collection($vendor)->toArray($request);

        if ($vendor) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }        
    }
    
    public function getItemByQrCode(Request $request)
    {
        $data = Item::where('id', $request->qr_code)->select('id', 'name', 'price', 'image')->first();

        if ($data) {
            return $this->apiSuccessMessageResponse('success', $data);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
            ]);
        } 
    }

    public function test(Request $request)
    {
        $data['order'] = OrderItem::where('order_id', $request->orderID)->get();
        return $data;
        $result =  GetLatestOrder::collection($data)->toArray($request);

        if ($data) {
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
