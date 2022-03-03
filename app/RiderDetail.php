<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Permission\Traits\HasRoles;

class RiderDetail extends Model
{
    use Notifiable;
    use HasRoles;
    use LogsActivity;

    protected $table = 'rider_detail';

    protected $fillable = [
        'rider_id', 'vehicle_brand', 'vehicle_model', 'vehicle_manufacterer_year', 'vehicle_plate_no', 'vehicle_image', 'rider_identification_image'];

    protected static $logAttributes = ['rider_id', 'vehicle_brand', 'vehicle_model', 'vehicle_manufacterer_year', 'vehicle_plate_no', 'vehicle_image', 'rider_identification_image'];
    protected static $logName = 'Rider Detail';
    protected static $logOnlyDirty = true;

    public function rider()
    {
        return $this->belongsTo('App\User', 'rider_id');
    }
}
