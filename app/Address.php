<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Address extends Model
{
   	use LogsActivity;
    protected $fillable = ['user_id', 'address'];

    protected static $logAttributes = ['user_id', 'address'];
    protected static $logName = 'Address';
    protected static $logOnlyDirty = true;

    public function User()
    {
    	return $this->belongsTo('App/User', 'user_id');
    }
}
