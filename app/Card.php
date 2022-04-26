<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Card extends Model
{
    use LogsActivity;

    protected $table = 'cards';
    protected $fillable = ['cardholder_name', 'card_number', 'expiry_date', 'cvv', 'stripe_token', 'user_id','default'];

    protected static $logAttributes = ['cardholder_name', 'card_number', 'expiry_date', 'cvv', 'stripe_token', 'user_id','default'];
    protected static $logName = 'Cards';
    protected static $logOnlyDirty = true;
}
