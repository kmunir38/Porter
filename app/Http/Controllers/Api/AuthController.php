<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator;
use stdClass;
use Socialite;
use Exception;
use App\User;
use Auth;

class AuthController extends Controller
{
    use ApiResponse;

    public function login(Request $request)
    {
        $user = new User();
        $user = $user->login($request);

        if($user instanceof \App\User ) {
            return $this->apiSuccessMessageResponse('Successfully logged in', $user);
        }

        if(gettype($user) == 'string') {
            return $this->apiErrorMessageResponse($user, []);
        } elseif(gettype($user) == 'array') {
            return $this->apiVerificationResponse($user['error'], $user['user'], 2);
        } else {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $user->errors());
        }
    }

    public function register(Request $request)
    {
        $user = new User();
        $user = $user->signup($request);

        if($user instanceof User)
        {
            if($request->verified_by == 'email') {
                $message = "The Verification link has been sent to your email";
            }
            return $this->apiSuccessMessageResponse($message, $user);
        }

        if(gettype($user) == 'string') {
            return $this->apiErrorMessageResponse($user, []);
        } else {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $user->errors());
        }
    }

    public function verifyOtp(Request $request)
    {
        $user = new User();
        
        if ($request->has('redirectToPassword')) 
        {
            $user = $user->verifyForgetCode($request);

            if( $user instanceof \App\User ) {
                return $this->apiSuccessMessageResponse('Successfully verified user', $user);
            }
        }
        else
        {
            $user = $user->verifyOtp($request);

            if( $user instanceof \App\User ) {
                return $this->apiSuccessMessageResponse('Successfully logged in', $user);
            }
        }

        if(gettype($user) == 'string') {
            return $this->apiErrorMessageResponse($user, []);
        } elseif(gettype($user) == 'array') {
            return $this->apiErrorMessageResponse($user['error'], []);
        } else {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $user->errors());
        }
    }

    public function resendOtp(Request $request)
    {
        $user = new User();
        $user = $user->resendOtp($request);

        if( $user instanceof \App\User ) {

            $message = "The Otp Code has been sent to your registered email";
            
            return $this->apiErrorMessageResponse($message);
        }

        if(gettype($user) == 'string') {
            return $this->apiErrorMessageResponse($user, []);
        } else {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $user->errors());
        }
    }

    public function forgetPassword(Request $request)
    {
        $record = new User();
        $record = $record->forgetPassword($request);

        if($record instanceof User) 
        {
            return $this->apiSuccessMessageResponse('We have sent you a otp on your registered email', $record);
        }

        if(gettype($record) == 'string') 
        {
            return $this->apiErrorMessageResponse($record, []);
        } 
        else 
        {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $record->errors());
        }
    }

    public function resetPassword(Request $request)
    {
        $record = new User();
        $record = $record->resetPassword($request);

        if ($record instanceof User) {
            return $this->apiSuccessMessageResponse('Your password has been reset successfully');
        }

        if(gettype($record) == 'string') 
        {
            return $this->apiErrorMessageResponse($record, []);
        } 
        else 
        {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $record->errors());
        }
    }

    public function changePassword(Request $request)
    {
        $record = new User();
        $record = $record->changePassword($request, Auth::user()->id);

        if($record instanceof User) 
        {
            return $this->apiSuccessMessageResponse('Your password has been changed successfully');
        }

        if(gettype($record) == 'string') 
        {
            return $this->apiErrorMessageResponse($record, []);
        } 
        else 
        {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $record->errors());
        }
    }

    public function getProfile(Request $request)
    {
        $data['records'] = (new User())->getProfile($request, Auth::user()->id);
        return $this->apiSuccessMessageResponse('success', $data);
    }

    public function riderProfile(Request $request)
    {
        $data['records'] = (new User())->riderProfile($request, Auth::user()->id);
        return $this->apiSuccessMessageResponse('success', $data);
    }

    public function userProfile(Request $request)
    {
        $id = $request->id;
        $data = User::where('id', $request->id)->first();

        $result = (new User())->getProfile($request, $id);
        return $this->apiSuccessMessageResponse('success', $result);
    }

    public function UpdateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'      => 'nullable|string|between:3,55',
            'email'     => 'nullable|email',
            'phone'     => 'nullable|numeric|digits_between:9,14',
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $record = new User();
        $record = $record->updateProfile($request, Auth::user()->id);
        if ($record instanceof User) {
            return $this->apiSuccessMessageResponse('Profile has been updated successfully', $record);
        }

        return response()->json([
            'status' => 1,
            'message' => 'Profile Updated Successfully!'
        ]);
    }

    public function saveUserDeviceToken(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'device_token' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }

        $user = User::find(Auth::user()->id);

        $user->update([
            'device_token' => $request->device_token,
        ]);

        if ($user) {
            return $this->apiSuccessMessageResponse('Device Token Saved Successfully');
        }

    }

    public function signOut(Request $request)
    {
        $user = $request->user();

        $user = $user->signOut($request);

        if ($user instanceof User) 
        {
            return $this->apiSuccessMessageResponse('Successfully logged out');
        }
        else
        {
            return $this->apiErrorMessageResponse($user, []);
        }
    }

    public function googleSignIn(Request $request)
    {
        try
        {
            $record = new User();
            $record = $record->userGoogleAuth($request);

            if (!$record instanceof User) 
            {
                if (gettype($record) == 'string') 
                {
                    return $this->apiErrorMessageResponse($record, []);
                }
                else
                {
                    return $this->apiValidatorErrorResponse('Invalid Parameters', $record->errors());
                }
            }
            else
            {
                return $this->apiSuccessMessageResponse('You hav\'n sign in successfully', $record);
            }

        }
        catch (Exception $e)
        {
            return $this->apiErrorMessageResponse($e->getMessage(), []);
        }
    }

    public function facebookSignIn(Request $request)
    {
        try
        {
            $record = new User();
            $record = $record->userFacebookAuth($request);

            if (!$record instanceof User) 
            {
                if (gettype($record) == 'string') 
                {
                    return $this->apiErrorMessageResponse($record, []);
                }
                else
                {
                    return $this->apiValidatorErrorResponse('Invalid Parameters', $record->errors());
                }  
            }
            else
            {
                return $this->apiSuccessMessageResponse('You hav\'n sign in successfully', $record);
            }

        }
        catch (Exception $e)
        {
            return $this->apiErrorMessageResponse($e->getMessage(), []);
        }
    }

    public function appleSignIn(Request $request)
    {
        try
        {
            $record = new User();
            $record = $record->AppleAuth($request);

            if (!$record instanceof User) 
            {
                if (gettype($record) == 'string') 
                {
                    return $this->apiErrorMessageResponse($record, []);
                }
                else
                {
                    return $this->apiValidatorErrorResponse('Invalid Parameters', $record->errors());
                }
            }
            else
            {
                return $this->apiSuccessMessageResponse('You hav\'n sign in successfully', $record);
            }

        }
        catch (Exception $e)
        {
            return $this->apiErrorMessageResponse($e->getMessage(), []);
        }

    }

    public function addRemove(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $id = $request->user_id;
        $record = User::find($id);

        if($record->onlineStatus == 0){
            $record->onlineStatus = 1;
            $record->save();
        } else {
            $record->onlineStatus = 0;
            $record->save();
        }
        if ($record instanceof \App\User) {
            return $this->apiSuccessMessageResponse('Success', []);
        }
    }
}
