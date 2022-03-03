<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Content extends Model
{
    use LogsActivity;

    protected $table = 'contents';
    protected $fillable = ['name', 'value', 'added_by'];

    protected static $logAttributes = ['name', 'value', 'added_by'];
    protected static $logName = 'Content';
    protected static $logOnlyDirty = true;

    public function user()
    {
    	return $this->belongsTo(User::class, 'added_by');
    }
}
