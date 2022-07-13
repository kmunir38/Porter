<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WalletTransactions extends Model
{
    protected $table = 'wallet_transactions';

    protected $fillable = ['user_id', 'amount', 'status'];

    public function user()
    {
    	return $this->belongsTo('App\User', 'user_id');
    }
}
