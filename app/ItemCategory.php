<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class ItemCategory extends Model
{
	use LogsActivity;

    protected $fillable = ['name','status'];

    protected static $logAttributes = ['name', 'status'];
    protected static $logName = 'ItemCategory';
    protected static $logOnlyDirty = true;
}
