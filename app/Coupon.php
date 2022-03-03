<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Coupon extends Model
{
	use LogsActivity;
    protected $fillable = ['title', 'voucher_code', 'discount', 'min_amount', 'exp_date'];

    protected static $logAttributes = ['title', 'voucher_code', 'discount', 'min_amount', 'exp_date'];
    protected static $logName = 'Coupon';
    protected static $logOnlyDirty = true;
    protected $fillable = [];
}
