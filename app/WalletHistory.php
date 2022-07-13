<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WalletHistory extends Model
{
    protected $table = 'wallet_history';

    protected $fillable = ['wallet_id', 'rider_id', 'withdraw_amount', 'date', 'status'];

    public function wallet()
    {
    	return $this->belongsTo('App\Wallet', 'wallet_id');
    }
}
