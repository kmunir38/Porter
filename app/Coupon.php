<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Coupon extends Model
{
	use LogsActivity;
    protected $fillable = ['title', 'restaurent_id', 'grocery_id', 'voucher_code', 'discount', 'min_amount', 'exp_date'];

    protected static $logAttributes = ['title', 'restaurent_id', 'voucher_code', 'discount', 'min_amount', 'exp_date'];
    protected static $logName = 'Coupon';
    protected static $logOnlyDirty = true;

    public function restaurent()
    {
    	return $this->belongsTo('App\User', 'restaurent_id');
    }

    public function grocery()
    {
    	return $this->belongsTo('App\User', 'grocery_id');
    }
}
