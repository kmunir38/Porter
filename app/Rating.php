<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Rating extends Model
{
	use LogsActivity;

    protected $fillable = ['customer_id','serviceProvider_id', 'item_id', 'rating', 'comments'];

    protected static $logAttributes = ['user_id', 'serviceProvider_id', 'item_id', 'rating', 'comments'];
    protected static $logName = 'Rating';
    protected static $logOnlyDirty = true;

    // public function vendors()
    // {
    // 	return $this->belongsTo('App\User', 'get_review');
    // }
    
    public function customer()
    {
    	return $this->belongsTo('App\User', 'customer_id'); 
    }   

    public function user()
    {
        return $this->belongsTo('App\User', 'serviceProvider_id'); 
    }    
}
	