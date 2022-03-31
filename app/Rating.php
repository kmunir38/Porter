<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Rating extends Model
{
	use LogsActivity;

    protected $fillable = ['user_id', 'item_id', 'rating', 'comments'];

    protected static $logAttributes = ['user_id', 'item_id', 'rating', 'comments'];
    protected static $logName = 'Rating';
    protected static $logOnlyDirty = true;

    // public function vendors()
    // {
    // 	return $this->belongsTo('App\User', 'get_review');
    // }
    
    public function user()
    {
    	return $this->belongsTo('App\User', 'user_id'); 
    }    
}
	