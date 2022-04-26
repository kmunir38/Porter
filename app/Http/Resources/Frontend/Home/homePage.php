<?php
namespace App\Http\Resources\Frontend\Home;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Item\SearchFood as SearchFood;
use App\Http\Resources\Frontend\Restaurant\GetRestaurant as PopularRestaurant;
use App\Http\Resources\Frontend\Item\Top as MostPopular;
use App\Http\Resources\Frontend\Item\Listing as ListingItems;

class HomePage extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id ?? '',
            'name' => $this->name ?? '',
            'ratings' => $this->ratings ?? '',
            'count_ratings' => $this->count_ratings ?? '',
            'image' => $this->items[0]->image ?? '',
            // 'top foods' => (new MostPopular($this))->resolve() ?? '',
            // 'search' => SearchFood::collection($this)->toArray($request),
            // 'recent items' => (new ListingItems($this))->resolve() ?? '',
        ];
    }
    
}