<?php
namespace App\Http\Resources\Frontend\Home;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Item\SearchFood as SearchFood;
use App\Http\Resources\Frontend\Restaurent\GetRestaurent as PopularRestaurent;
use App\Http\Resources\Frontend\Item\Top as MostPopular;
use App\Http\Resources\Frontend\Item\Listing as ListingItems;

class HomePage extends JsonResource
{
    public function toArray($request)
    {   
        return [
            // 'search' => SearchFood::collection($this)->toArray($request),
            'restaurent' => (new PopularRestaurent($this->restaurent))->resolve(),
            'top foods' => (new MostPopular($this))->resolve() ?? '',
            'recent items' => (new ListingItems($this))->resolve() ?? '',
        ];
    }
}