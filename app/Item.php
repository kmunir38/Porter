<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use DB;
use Auth;
class Item extends Model
{
	use LogsActivity;
    protected $fillable = ['name','restaurant_id', 'category_id', 'rider_id', 'grocery_id', 'shopper_id', 'price', 'ingredients', 'image', 'discount', 'start_date', 'end_date', 'status', 'description', 'qr_code'];

    protected static $logAttributes = ['name','restaurant_id', 'category_id', 'rider_id', 'grocery_id', 'shopper_id', 'price', 'ingredients', 'image', 'discount', 'start_date', 'end_date', 'status', 'description', 'qr_code'];
    protected static $logName = 'Item';
    protected static $logOnlyDirty = true;

    protected $appends = ['ratings', 'count_rating'];

    public function getRatingsAttribute($value)
    {    
        $ratings = DB::table('ratings')->select('item_id', DB::raw('SUM(rating) as rate'))
                ->groupBy('item_id')->orderBy('rating')->where('item_id', $this->id)
                ->avg('rating');        
        return $ratings ?? 0;
    }

    public function getCountRatingAttribute($value)
    {    
        $ratings = DB::table('ratings')->groupBy('item_id')->where('item_id', $this->id)
                ->count('rating');        
        return $ratings ?? 0;
    }

    public function scopeIsWithinMaxDistance($query, $coordinates, $radius) 
    {

    $haversine = "(6371 * acos(cos(radians(" . $coordinates['latitude'] . ")) 
                    * cos(radians(`latitude`)) 
                    * cos(radians(`longitude`) 
                    - radians(" . $coordinates['longitude'] . ")) 
                    + sin(radians(" . $coordinates['latitude'] . ")) 
                    * sin(radians(`latitude`))))";

            return $query->select('*')
                 ->selectRaw("{$haversine} AS distance")
                 ->whereRaw("{$haversine} < ?", [$radius]);
    }

    public function ListingItems($request)
    {
        $item = Item::where('status', 1);
        
        if ($request->has('cat_id')) {
            $item->whereHas('category', function ($query) use ($request) {
                $query->where('category_id', $request->get('cat_id'));
            });
        }

        if ($request->has('min_price') && $request->has('max_price')) {
            $item->whereBetween('price', [$request->get('min_price'), $request->get('max_price')]);
        }

        if($request->latitude && $request->longitude && $request->distance) {

            $distance = $request->get('distance');

            if ($distance == '10km') {
              $distance = '10000';
            } else if($distance == '20km') {
              $distance = '20000';
            } else if($distance == '50km') {
              $distance = '50000';
            } else if($distance == '100km') {
              $distance = '100000';
            } else if($distance == '150km') {
              $distance = '150000';
            } else if($distance == '200km') {
              $distance = '200000';
            }
            $item = $item->isWithinMaxDistance(['latitude' => $request->latitude, 'longitude' => $request->longitude], $distance);
        }
        return $item->get(); 
    }

    public function getPopularItems()
    {
        $items = Item::get();
        return $items;
    }

        public function grocery()
    {
        return $this->belongsTo('App\User', 'grocery_id');
    }

    public function restaurant()
    {
    	return $this->belongsTo('App\User', 'restaurant_id');
    }

    public function shopper()
    {
    	return $this->belongsTo('App\User', 'shopper_id');
    }

    public function rider()
    {
    	return $this->belongsTo('App\User', 'rider_id');
    }    

    public function category()
    {
        return $this->belongsTo('App\ItemCategory', 'category_id');
    }

    public function OrderItem()
    {
        return $this->hasMany('App\OrderItem');
    }

    public function expert()
    {
        return $this->belongsTo('App\ItemExpertise', 'expertise');
    }
}
