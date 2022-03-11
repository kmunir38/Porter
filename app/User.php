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
use App\Http\Resources\Frontend\Rider\GetProfile as GetRiderProfile;
use DB;

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
    protected $fillable = ['added_by', 'updated_by', 'name', 'email', 'phone', 'address', 'image', 'password', 'otp', 'device_type', 'latitude', 'longitude',
         'age', 'dob', 'device_token', 'identity', 'id_image', 'description', 'verified_by', 'social_provider', 'social_token', 'social_id', 'onlineStatus'];

    protected static $logAttributes = ['added_by', 'updated_by', 'name', 'email', 'phone', 'address', 'image', 'password', 'otp', 'device_type', 'latitude', 'longitude',
         'age', 'dob', 'device_token', 'identity', 'id_image', 'description', 'verified_by', 'social_provider', 'social_token', 'social_id', 'onlineStatus'];
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

    protected $appends = ['earnings', 'spent', 'deliveries', 'cancel_orders', 'active_status'];


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

    public function getDeliveriesAttribute()
    {        
        $data = Order::where('rider_id', $this->id)->count('rider_id');
        return $data;
    }

    public function getEarningsAttribute()
    {        
        $data = Order::where('order_status', 'completed')->where('restaurent_id', $this->id)->sum('grand_total');
        return $data;
    }

    public function getSpentAttribute()
    {        
        $data = Order::where('order_status', 'completed')->where('user_id', $this->id)->sum('grand_total');
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
        if($request->has('email')) {
            $validationRules['email'] = 'required|string|email';
        }
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
            'verified_by' => $type,
            'otp' => $token,
            $this->assignRole(2)
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
        $record->id_image = $request->id_image ? $request->id_image : $currentIDimage;
        $record->description = $request->description ? $request->description : $currentDesc;
        $record->latitude = $request->latitude ? $request->latitude : $currentlat;
        $record->longitude = $request->longitude ? $request->longitude : $currentlon;
        $record->image = $request->image ? $request->image : $currentImage;
        $record->save();

        return $record;
    }

    public function getProfile($request, $id)
    {
        $record = $this->find($id);

        if (!$record) {
            return 'Unauthorized';
        }

        return (new GetUserProfile($record))->resolve();
    }

    public function riderProfile($request, $id)
    {
        $record = $this->find($id);

        if (!$record) {
            return 'Unauthorized';
        }

        return (new GetRiderProfile($record))->resolve();
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

    public function item()
    {
        return $this->hasMany('App\Item', 'grocery_id');        
    }

    public function items()
    {
        return $this->hasMany('App\Item', 'restaurent_id');        
    }


    // Customer Section End Created By MYTECH MAESTRO
}
