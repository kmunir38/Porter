<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Setting extends Model
{
	use LogsActivity;

	protected $table = 'settings';
    protected $fillable = ['name', 'value', 'added_by'];

	protected static $logAttributes = ['name', 'value', 'added_by'];
    protected static $logName = 'Setting';
    protected static $logOnlyDirty = true;    
}
