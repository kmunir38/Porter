<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Coupon extends Model
{
	use LogsActivity;
    protected $fillable = ['title', 'restaurant_id', 'grocery_id', 'voucher_code', 'discount', 'min_amount', 'exp_date', 'description'];

    protected static $logAttributes = ['title', 'restaurant_id', 'grocery_id', 'voucher_code', 'discount', 'min_amount', 'exp_date', 'description'];
    protected static $logName = 'Coupon';
    protected static $logOnlyDirty = true;

    public function restaurant()
    {
    	return $this->belongsTo('App\User', 'restaurant_id');
    }

    public function grocery()
    {
    	return $this->belongsTo('App\User', 'grocery_id');
    }
}
