<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class ItemCategory extends Model
{
	use LogsActivity;

    protected $fillable = ['name','use_for','status'];

    protected static $logAttributes = ['name','use_for','status'];
    protected static $logName = 'ItemCategory';
    protected static $logOnlyDirty = true;

    public function item()
    {
    	return $this->hasMany('App\Item', 'category_id');
    }
}
