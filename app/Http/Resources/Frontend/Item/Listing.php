<?php
namespace App\Http\Resources\Frontend\Item;
use Illuminate\Http\Resources\Json\JsonResource;

class Listing extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->name,
            'rating' => $this->ratings,
            'price' => $this->price,
            'description' =>  $this->description,
            'image'     =>  $this->image,            
            'item_count'     =>  $this->item_count ?? '',
        ];
    }
}