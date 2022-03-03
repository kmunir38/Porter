<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $fillable = [ 'sender_id',
							'receiver_id',
							'trigger_id',
							'trigger_type',
							'title',
							'message',
							'device_type',
							'success',
							'failure',
							'image',
							'is_read'];
   

	public function sendPushNotification($fcm_token, $title, $message, $id = "", $trigger_type = "home", $trigger_id = "") 
	{
    $device = User::where('device_token', $fcm_token)->first();
    $push_notification_key = env('USER_NOTIFICATION');
    if($device) {
    $url = "https://fcm.googleapis.com/fcm/send";
    $header = [
        'Authorization:key=' . $push_notification_key,
        'Content-Type: application/json',
    ];

    $postdata = '{
            "notification" : {
                "title":"' . $title . '",
                "text" : "' . $message . '",
                "body" : "' . $message . '"
            },
        "data" : {
            "id" : "'.$id.'",
            "title":"' . $title . '",
            "description" : "' . $message . '",
            "text" : "' . $message . '",
            "body" : "' . $message . '",
            "trigger_type" : "' . $trigger_type . '",
            "trigger_id" : "' . $trigger_id . '",
            "is_read": 0
          }
    }';

    $ch = curl_init();
    $timeout = 120;
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);  

    // Get URL content
    $result = curl_exec($ch);
    // close handle to release resources
    curl_close($ch);
    $success = '';
    $failure = '';
    $res = (array) json_decode($result);
    if(isset($res['success'])) {
        $success = $res['success'];
    }
    if(isset($res['failure'])) {
        $failure = $res['failure'];
    }

    $this->title = $title;
    $this->message = $message;
    $this->trigger_type = $trigger_type;
    $this->trigger_id = $trigger_id;
    $this->sender_id = \Auth::user()->id;
    $this->receiver_id = $device->id;
    $this->device_type = $device->device_type;
    $this->success = $success;
    $this->failure = $failure;
    $this->save();

    return $this;
    } else {
    return 0;
    }
    }
    public function user()
    {
    	return $this->belongsTo('App\User', 'user_id');
    } 
}
