<?php

namespace App;
use App\Classes\Helper;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Support\Facades\Validator;
use App\Http\Traits\ApiResponse;
use Laravel\Passport\HasApiTokens;
use Illuminate\Support\Facades\Auth;
use Spatie\Activitylog\Traits\LogsActivity;
use App\Http\Resources\Frontend\Customer\GetProfile as GetUserProfile;
use App\Http\Resources\Frontend\Shopper\GetProfile as GetShopperProfile;
use App\Http\Resources\Frontend\Rider\GetProfile as GetRiderProfile;
use App\Http\Resources\Frontend\Rider\GetRiderDetails as GetRider;
use App\Http\Resources\Frontend\Order\OrdersArray as GetCashHistory;
use App\Http\Resources\Frontend\Restaurant\GetRestaurant as GetRestProfile;
use DB;
use App\Rating;
use Carbon\Carbon;
use Hash;

class User extends Authenticatable
{
    use Notifiable;
    use HasRoles;
    use HasApiTokens;
    use LogsActivity;
    use ApiResponse;

    protected $guard = 'api';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['added_by', 'updated_by', 'name', 'email', 'phone', 'address', 'image', 'password', 'otp', 'device_type', 'latitude', 'longitude', 'br_code',
         'age', 'dob', 'country_code', 'country_flag', 'device_token', 'identity', 'id_image', 'description', 'verified_by', 'social_provider', 'social_token', 'social_id', 'onlineStatus', 'min_order', 'order_type', 'confirm_payment_proceed', 'wallet'];

    protected static $logAttributes = ['added_by', 'updated_by', 'name', 'email', 'phone', 'address', 'image', 'password', 'otp', 'device_type', 'latitude', 'longitude', 'br_code',
         'age', 'dob', 'country_code', 'country_flag', 'device_token', 'identity', 'id_image', 'description', 'verified_by', 'social_provider', 'social_token', 'social_id', 'onlineStatus', 'min_order', 'order_type', 'confirm_payment_proceed', 'wallet'];
    protected static $logName = 'User';
    protected static $logOnlyDirty = true;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected $appends = ['ratings', 'count_ratings', 'earnings', 'spent', 'rider_deliveries', 'shopper_deliveries',
             'cancel_orders', 'active_status', 'user_role'];

    public function GetUserRoleAttribute()
    {
        $data = DB::table('model_has_roles')->where('model_id', $this->id)->first();
        if($data){
            if($data->role_id == 8){
                return 'grocery';    
            }
            if($data->role_id == 6){
                return 'restaurant';    
            }
            if($data->role_id == 7){
                return 'shopper';    
            }
            if($data->role_id == 4){
                return 'rider';    
            }
            if($data->role_id == 2){
                return 'customer';    
            }        
        }
    }

    public function getRatingsAttribute()
    {        
        $rate = Rating::where('serviceProvider_id', $this->id)->avg('rating');
        return $rate ?? 0;
    }

    public function getCountRatingsAttribute()
    {        
        $rate = Rating::where('serviceProvider_id', $this->id)->count('rating');
        return $rate ?? 0;
    }

    public function getActiveStatusAttribute()
    {        
        if($this->onlineStatus == 1) {
            return 'online';
        } else {
            return 'offline';
        }
    }
    
    public function getCancelOrdersAttribute()
    {        
        $data = CancelOrder::where('cancel_by', $this->id)->count('cancel_by');
        return $data;
    }

    public function getRiderDeliveriesAttribute()
    {        
        $data = Order::where('rider_id', $this->id)->where('order_status', 'completed')->count('rider_id');
        return $data;
    }
    
    public function getShopperDeliveriesAttribute()
    {        
        $data = Order::where('grocery_id', $this->assigned_grocery)->where('order_status', 'completed')->count('grocery_id');
        return $data;
    }

    public function getEarningsAttribute()
    {        
        $data = Order::where('order_status', 'completed')->where('restaurant_id', $this->id)->sum('grand_total');
        return $data;
    }

    public function getSpentAttribute()
    {        
        $data = Order::where('order_status', 'completed')->where('customer_id', $this->id)->sum('grand_total');
        return $data;
    }

    // Customer Section Start Created By MYTECH MAESTRO

    public static function verifyOtp($request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'nullable|email',
            'otp' => 'required|numeric|digits:4'
        ]);

        if ($validator->fails()) {
            return $validator;
        }

        $user = User::where('email', $request->email)->first();

        if($user) {
            if($request->otp == $user->otp) {
                if ($user->verified_by == 'email' && $user->email_verified_at == '' || $request->email) {
                    $user->email_verified_at = date('Y-m-d H:i:s');
                    $user->otp = null;
                    if ($request->email) {
                        $user->email = $request->email;
                    }
                    $user->save();

                    if (!Auth::guard('frontend')->loginUsingId($user->id)) 
                    {
                        return 'Something wen\'t wrong';
                    }

                    if (Auth::guard('frontend')->user()) 
                    {
                        $user = Auth::guard('frontend')->user();
                    }

                    $tokenResult = $user->createToken('Personal Access Token');

                    $token = $tokenResult->token;

                    if ($request->remember_me)
                    {
                        $token->expires_at = Carbon::now()->addWeeks(1);
                    }

                    $token->save();

                    $device_type = $request->has('device_type') ? $request->device_type : '';
                    $device_token = $request->has('device_token') ? $request->device_token : '';

                    if ($device_token && $device_type) 
                    {
                        $user->device_type   = $device_type;
                        $user->device_token  = $device_token;

                        $user->save();
                    }

                    $user->token = 'Bearer ' . $tokenResult->accessToken;
                    // $user->roles = $user->roles ?? [];
                    
                    return $user;
                    
                } else {
                    return ['error' => 'User is already verified'];
                }
            } else {
                return 'Please enter valid otp';
            }
        } else {
            return 'User is invalid';
        }
    }

    public function resendOtp($request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email'
        ]);

        if ($validator->fails()) {
            return $validator;
        }
        $record = $this::whereNotNull('otp');
        
        $record = $this::query();
        
        if ($request->email)
        {
            $record->where('email', $request->email);
        }

        $record = $record->first();

        if (!$record) 
        {
            return 'Invalid User';
        }

        if($record->verified_by == 'email') {
            $data = [
                'email' => $record->email,
                'name' => $record->name,
                'subject' => 'Resend Account verification code',
            ];

            Helper::sendEmail('accountVerification', ['data' => $record], $data);
        }

        return $record;
    }

    public function login($request)
    {
        $validationRules['email'] = 'required|string|email';
        
        $validationRules['password'] = 'required|string|min:6|max:16';
        $validationRules['device_type'] = 'in:android,ios';
        $validationRules['device_token'] = 'string|max:255';

        $validator = Validator::make($request->all(), $validationRules);

        if($validator->fails()) {
            return $validator;
        }

        $attempt_by_email = $user = User::where('email', $request->email)->first();

        if($attempt_by_email) {
            $credentials = ['email' => $request->email, 'password' => $request->password];
        }

        if(!$user) {
            return "Invalid Credentials";
        }

        if(!Auth::guard('frontend')->attempt($credentials))
            return 'Invalid Credentials';

        if($attempt_by_email && Auth::guard('frontend')->user()->email_verified_at == '') {

            $user->otp = mt_rand(1000, 9999);
            $user->save();

            $data = [
                'email' => $user->email,
                'name' => $user->name,
                'subject' => 'Account verification code',
            ];

            Helper::sendEmail('accountVerification', ['data' => $user], $data);

            return ['error' => 'User is not verified', 'user' => $user];

        }

        $user = Auth::guard('frontend')->user();

        $tokenResult = $user->createToken('Personal Access Token');

        $token = $tokenResult->token;

        if($request->remember_me)
            $token->expires_at = Carbon::now()->addWeeks(1);

        $token->save();

        $device_type = $request->has('device_type') ? $request->device_type : '';
        $device_token = $request->has('device_token') ? $request->device_token : '';

        if($device_token && $device_type) {

            $user->device_type  = $device_type;
            $user->device_token = $device_token;

            $user->save();
            try {

            } catch(\Exception $eex) {

            }
        }

        $user->token = 'Bearer ' . $tokenResult->accessToken;
        // $user->roles = $user->roles ?? [];
        return $user;
    }

    public function signup($request)
    {
        $validationRules['name'] = 'required|string|min:3|max:55';
        $validationRules['password'] = 'required|string|min:6|max:16|confirmed';
        $validationRules['verified_by'] = 'required|in:email';
        $validationRules['email'] = 'required|string|email|min:5|max:155|unique:users';
        $validationRules['role'] = 'exists:roles,id';
        $validationRules['phone'] = 'required';
        
        if($request->role == 6 || $request->role == 8){
            $validationRules['address'] = 'required';
        }
        
        $validator = Validator::make($request->all(), $validationRules);

        if ($validator->fails()) {
            return $validator;
        }

        if($request->verified_by == 'email') {
            
            $type = 'email';
            $token = mt_rand(1000, 9999);
        }

        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => bcrypt($request->password),
            'country_code' => $request->country_code,
            'address' => $request->address,
            'verified_by' => $type,
            'br_code' => $request->br_code,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'image' => 'public/uploads/users/img/user-avatar.png',
            'otp' => $token,
            $this->assignRole($request->role)
        ];

        $this->fill($data);
        $this->save();

        if($this->verified_by == 'email') {
            $data = [
                'email' => $this->email,
                'name' => $this->name,
                'subject' => 'Account verification code',
            ];

            Helper::sendEmail('accountVerification', ['data' => $this], $data);
        }
        return $this;        
    }

    public function forgetPassword($request)
    {
        $record = $this::where('email', $request->email)->first();

        $requestFor = 'email';

        if (!$record) 
        {
            return 'Email Not Found!';
        }

        $record->otp = mt_rand(1111, 9999);
        $record->verified_by = $requestFor;
        $record->save();

        if ($requestFor = 'email') 
        {
            $data = [
                'email' => $record->email,
                'name' => $record->name,
                'subject' => 'Account recovery code',
            ];

            Helper::sendEmail('accountVerification', ['data' => $record], $data);
        }

        return $record;
    }

    public function verifyForgetCode($request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'nullable|email',
            'otp' => 'required|numeric|digits:4'
        ]);

        if ($validator->fails()) {
            return $validator;
        }

        $record = $this::where('email', $request->email)->first();

        if (!$record) 
        {
            return 'Invalid user';
        }

        if ($record->otp == null) 
        {
            return ['error' => 'User is already verified'];
        }

        if ($record->otp != $request->otp) 
        {
            return 'Please enter valid otp';
        }

        $record->otp = null;
        $record->save();

        if ($record->verified_by = 'email') 
        {
            $data = [
                'email' => $record->email,
                'name' => $record->name,
                'subject' => 'Account recovery code',
            ];

            Helper::sendEmail('accountVerification', ['data' => $record], $data);
        } 

        return $record;
    }

    public function changePassword($request, $id)
    {
        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            'password' => 'required|string|min:6|max:16|confirmed'
        ]);

        if ($validator->fails()) 
        {
            return $validator;
        }

        $record = $this::find($id);
        if (Hash::check($request->old_password, $record->password)) {
            $record->password = bcrypt($request->password);
            $record->save();
        } else {
            return 'Current password doesn,t match';
        }

        return $record;
    }

    public function resetPassword($request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6|max:16|confirmed'
        ]);

        if ($validator->fails()) 
        {
            return $validator;
        }

        $record = $this::query();

        if($request->email)
        {
            $record->where('email', $request->email);
        }

        $record = $record->first();
        
        if (!$record) 
        {
            return 'Invalid user';
        }

        $record->password = bcrypt($request->password);
        $record->save();

        return $record;
    }

    public function updateProfile($request, $id)
    {   

        $checkUser = $this::where('id', $id)->first();

        $currentName = $checkUser->name;
        $currentEmail = $checkUser->email;
        $currentPhone = $checkUser->phone;
        $currentAddress = $checkUser->address;
        $currentZip_code = $checkUser->zip_code;
        $currentCuisine_type = $checkUser->cuisine_type;
        $currentDelivery_time = $checkUser->delivery_time;
        $currentDiscount = $checkUser->discount;
        $currentOrdertype = $checkUser->order_type;
        $currentMinOrder = $checkUser->min_order;
        $currentDistance = $checkUser->serv_distance;
        $currentDOB      = $checkUser->dob;
        $currentAge      = $checkUser->age;
        $currentIdentity = $checkUser->identity;
        $currentIDimage  = $checkUser->id_image;
        $currentDesc     = $checkUser->description;
        $currentlat      = $checkUser->latitude;
        $currentlon      = $checkUser->longitude;
        $currentImage    = $checkUser->image;
        $currentCountryCode    = $checkUser->country_code;

        if($request->image){
        $image = $request->image;
        $image_name = rand().'.'. $image->getClientOriginalExtension();
        $image->move(public_path('uploads/users/img/'), $image_name);
        }
        if($request->id_image){
        $idImg = $request->id_image;
        $id_image = rand().'.'. $idImg->getClientOriginalExtension();
        $idImg->move(public_path('uploads/users/img/'), $id_image);
        }
        $record = $this::find($id);
        $record->name = $request->name ? $request->name : $currentName;
        $record->email = $request->email ? $request->email : $currentEmail;
        $record->phone = $request->phone ? $request->phone : $currentPhone;
        $record->address = $request->address ? $request->address : $currentAddress;
        $record->zip_code = $request->zip_code ? $request->zip_code : $currentZip_code;
        $record->cuisine_type = $request->cuisine_type ? $request->cuisine_type : $currentCuisine_type;
        $record->delivery_time = $request->delivery_time ? $request->delivery_time : $currentDelivery_time;
        $record->discount = $request->discount ? $request->discount : $currentDiscount;
        $record->order_type = $request->order_type ? $request->order_type : $currentOrdertype;
        $record->min_order = $request->min_order ? $request->min_order : $currentMinOrder;
        $record->serv_distance = $request->serv_distance ? $request->serv_distance : $currentDistance;
        $record->dob = $request->dob ? $request->dob : $currentDOB;
        $record->age = $request->age ? $request->age : $currentAge;
        $record->identity = $request->identity ? $request->identity : $currentIdentity;
        if($request->id_image)
        {
        $record->id_image = 'public/uploads/users/img/'.$id_image;           
        } else {
            $record->id_image = $currentIDimage;
        }
        if($request->image){
        $record->image = 'public/uploads/users/img/'.$image_name ;
        } else {
            $record->image = $currentImage;
        }
        $record->description = $request->description ? $request->description : $currentDesc;
        $record->latitude = $request->latitude ? $request->latitude : $currentlat;
        $record->longitude = $request->longitude ? $request->longitude : $currentlon;
        $record->country_code = $request->country_code ? $request->country_code : $currentCountryCode;
        $record->save();

        return $record;
    }

    public function getProfile($request, $id)
    {
        $record = $this->find($id);
        // return $record;
        if (!$record) {
            return 'Unauthorized';
        }

        return (new GetUserProfile($record))->resolve();
    }
    
    public function shopperProfile($request, $id)
    { 
        $record = $this->find($id);
        if (!$record) {
            return 'Unauthorized';
        }

        return (new GetShopperProfile($record))->resolve();
    }

    public function riderProfile($request, $id)
    {
        $record = $this->find($id);

        if (!$record) {
            return 'Unauthorized';
        }

        return (new GetRiderProfile($record))->resolve();
    }

    public function restaurantProfile($request, $id)
    {
        $record = $this->find($id);

        if (!$record) {
            return 'Unauthorized';
        }
        
        return $record ?? '';
        // return (new GetRestProfile($record))->resolve();
    }

    public function signOut($request)
    {
        try 
        {
            $user = $request->user();
            $user->device_token = null;
            $user->device_type = null;
            $user->save();
            $request->user()->token()->revoke();
        } 
        catch (\Exception $exception) 
        {
            if ($exception instanceof \Illuminate\Auth\AuthenticationException)
            {
                return 'The session is already logged out';
            }
        }

        return $user;
    }
    
    public function userGoogleAuth($request)
    {
        $validationRules['name'] = 'required|string|min:3|max:55';
        $validationRules['email'] = 'required|string|email|min:5|max:155';
        $validationRules['social_token'] = 'required|string';

        $validator = Validator::make($request->all(), $validationRules);

        if ($validator->fails()) {
            return $validator;
        }

        $record = $this::where('social_token', $request->social_token)
        ->first();

        if (!$record) 
        {
            $record = $this;

            $record->name = $request->name;
            $record->email = $request->email;
            $record->verified_by = 'google';
            $record->social_id = $request->social_token;
            $record->password = bcrypt('googlePassword');
            $record->social_provider = 'google';
            $record->image = 'public/uploads/users/img/user-avatar.png';
            $record->social_token = $request->social_token;
            $record->email_verified_at = date('Y-m-d H:i:s');   
            $record->assignRole($request->role);
            $record->save();
        } else {
            
            $record->save();
        }

        if (!Auth::guard('frontend')->loginUsingId($record->id)) 
        {
            return 'Something wen\'t wrong';
        }

        if (Auth::guard('frontend')->user()) 
        {
            $user = Auth::guard('frontend')->user();
        }

        $tokenResult = $user->createToken('Personal Access Token');

        $token = $tokenResult->token;

        if ($request->remember_me) 
        {
            $token->expires_at = Carbon::now()->addWeeks(1);
        }

        $token->save();

        $device_type = $request->has('device_type') ? $request->device_type : '';
        $device_token = $request->has('device_token') ? $request->device_token : '';

        if ($device_token && $device_type) 
        {
            $user->device_type = $device_type;
            $user->device_token = $device_token;

            $user->save();
        }

        $user->token = 'Bearer ' . $tokenResult->accessToken;
        // $user->roles = $user->roles ?? [];

        return $user;
    }

    public function userFacebookAuth($request)
    {
        $validationRules['name'] = 'required|string|min:3|max:55';
        $validationRules['email'] = 'required|string|email|min:5|max:155';
        $validationRules['social_token'] = 'required|string';

        $validator = Validator::make($request->all(), $validationRules);

        if ($validator->fails()) {
            return $validator;
        }

        $record = $this::where('social_token', $request->social_token)
        ->first();

        if (!$record) 
        {
            $record = $this;
            
            $record->name = $request->name;
            $record->email = $request->email;
            $record->verified_by  = 'facebook';
            $record->social_id = $request->social_token;
            $record->password = bcrypt('facebookPassword');
            $record->social_provider = 'facebook';
            $record->social_token = $request->social_token;
            $record->image = 'public/uploads/users/img/user-avatar.png';
            $record->email_verified_at = date('Y-m-d H:i:s');
            // $record->isFirstTime = 1;
            $record->assignRole($request->role);
            $record->save();
        } else {
            // $record->isFirstTime = 0;
            $record->save();
        }

        if (!Auth::guard('frontend')->loginUsingId($record->id)) 
        {
            return 'Something wen\'t wrong';
        }

        if (Auth::guard('frontend')->user()) 
        {
            $user = Auth::guard('frontend')->user();
        }

        $tokenResult = $user->createToken('Personal Access Token');

        $token = $tokenResult->token;

        if ($request->remember_me)
        {
            $token->expires_at = Carbon::now()->addWeeks(1);
        }

        $token->save();

        $device_type = $request->has('device_type') ? $request->device_type : '';
        $device_token = $request->has('device_token') ? $request->device_token : '';

        if ($device_token && $device_type) 
        {
            $user->device_type   = $device_type;
            $user->device_token  = $device_token;

            $user->save();
        }

        $user->token = 'Bearer ' . $tokenResult->accessToken;
        // $user->roles = $user->roles ?? [];
        
        return $user;
    }

    public function userAppleAuth($request)
    {
        $validationRules['name'] = 'required|string|min:3|max:55';
        $validationRules['email'] = 'required|string|email|min:5|max:155';
        $validationRules['social_token'] = 'required|string';

        $validator = Validator::make($request->all(), $validationRules);

        if ($validator->fails()) {
            return $validator;
        }

        $record = $this::where('social_token', $request->social_token)
        ->first();

        if (!$record) 
        {
            $record = $this;

            $record->name = $request->name;
            $record->email = $request->email;
            $record->verified_by = 'apple';
            $record->social_id = $request->social_token;
            $record->password = bcrypt('applePassword');
            $record->social_provider = 'apple';
            $record->social_token = $request->social_token;
            $record->email_verified_at = date('Y-m-d H:i:s');
            // $record->isFirstTime = 1;
            $record->assignRole(2);
            $record->save();
        } else {
            // $record->isFirstTime = 0;
            $record->save();
        }

        if (!Auth::guard('frontend')->loginUsingId($record->id)) 
        {
            return 'Something wen\'t wrong';
        }

        if (Auth::guard('frontend')->user()) 
        {
            $user = Auth::guard('frontend')->user();
        }

        $tokenResult = $user->createToken('Personal Access Token');

        $token = $tokenResult->token;

        if ($request->remember_me) 
        {
            $token->expires_at = Carbon::now()->addWeeks(1);
        }

        $token->save();

        $device_type = $request->has('device_type') ? $request->device_type : '';
        $device_token = $request->has('device_token') ? $request->device_token : '';

        if ($device_token && $device_type) 
        {
            $user->device_type = $device_type;
            $user->device_token = $device_token;

            $user->save();
        }

        $user->token = 'Bearer ' . $tokenResult->accessToken;
        // $user->roles = $user->roles ?? [];
        
        return $user;
    }

    public function getCashPaymentHistory($request)
    {
        $data = Order::where('rider_id', $request->riderID)->where('order_status', 'completed')->where('payment_method', 'cash')
            ->whereDate('created_at', '=', date('Y-m-d', strtotime($request->date)))->get();
        $result = GetCashHistory::collection($data)->toArray($request);    
        return $result;
    }
    public function getCardPaymentHistory($request)
    {
        $data = Order::where('rider_id', $request->riderID)->where('order_status', 'completed')->where('payment_method', 'card')
            ->whereDate('created_at', '=', date('Y-m-d', strtotime($request->date)))->get();
        $result = GetCashHistory::collection($data)->toArray($request);    
        return $result;
    }
    public function getUserDetails($request){
        $user = User::where('id', $request->riderID)->select('id','name', 'image')->first();
        $result = (new GetRider($user))->resolve();
        return $result;
    }
    public function item()
    {
        return $this->hasMany('App\Item', 'grocery_id');        
    }

    public function items()
    {
        return $this->hasMany('App\Item', 'restaurant_id');        
    }

    public function userRating()
    {
        return $this->hasMany('App\Rating', 'customer_id');
    }

    public function order()
    {
        return $this->hasMany('App\Order', 'rider_id');
    }
    
    public function addresses()
    {
        return $this->hasMany('App\Address', 'id', 'address_id');
    }
    
    public function grocery(){
        return $this->belongsTo('App\User', 'assigned_grocery');
    }
    
    public function shopper()
    {
        return $this->belongsTo('App\User', 'assigned_grocery');
    } 
    public function cancel_orders()
    {
        return $this->hasMany('App\CancelOrder', 'id');
    }  
}
