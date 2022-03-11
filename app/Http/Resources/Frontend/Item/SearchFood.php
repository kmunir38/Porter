<?php

namespace App\Http\Resources\Frontend\Item;

use Illuminate\Http\Resources\Json\JsonResource;

class SearchFood extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'rating' => $this->ratings,
            'price' => $this->price,
            'description' =>  $this->description,
            'image'     =>  $this->image,
        ];
    }
}
