<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WalletItem extends Model
{
    protected $table = 'wallet_items';
    protected $fillable = ['wallet_id', 'order_id', 'order_amount', 'commission'];

    public function wallet()
    {
    	return $this->belongsTo('App\Wallet', 'wallet_id');
    }

    public function order()
    {
    	return $this->belongsTo('App\Order', 'order_id');
    }
}
