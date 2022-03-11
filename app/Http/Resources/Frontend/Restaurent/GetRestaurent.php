<?php
namespace App\Http\Resources\Frontend\Restaurent;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Request;
use App\Http\Resources\Frontend\Item\Listing as ItemList;

class GetRestaurent extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'            => $this->id,
            'name'          => $this->name,
            'email'         => $this->email,
            'phone'         => $this->phone,
            'cuisine_type'  => $this->cuisine_type,
            'earning'       => $this->earnings,
            'ratings'       => $this->ratings,
            'items'         => ItemList::collection($this->item)->toArray($request)
        ];
    }
}