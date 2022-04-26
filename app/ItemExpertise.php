<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class ItemExpertise extends Model
{
	use LogsActivity;

	protected $table = 'item_expertise';
    protected $fillable = ['name','image'];

    protected static $logAttributes = ['name','image'];
    protected static $logName = 'ItemExpertise';
    protected static $logOnlyDirty = true;

    public function item()
    {
    	return $this->hasMany('App\Item', 'expertise');
    }
}
