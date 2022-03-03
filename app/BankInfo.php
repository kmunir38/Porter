<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BankInfo extends Model
{
	protected $table = 'bank_info';
    protected $fillable = ['user_id', 'fullname', 'bank_name', 'acc_no', 'iban', 'branch'];

    public function user()
    {
    	return $this->belongsTo('App\User', 'user_id');
    }
}
