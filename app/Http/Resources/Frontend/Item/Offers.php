<?php
namespace App\Http\Resources\Frontend\Item;
use Illuminate\Http\Resources\Json\JsonResource;

class Offers extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->name,
            'rating' => $this->restaurent->name,
            'rating' => $this->ratings,
            'image' =>  $this->image,
            'discount' => $this->discount .' '.'%'
        ];
    }
}