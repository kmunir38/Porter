<?php
namespace App\Http\Resources\Frontend\Customer;
use Illuminate\Http\Resources\Json\JsonResource;

class ViewDeserts extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->name,
            'image' => $this->image,
            'Restaurent' => $this->restaurant->name,
            'restaurent rating' => $this->restaurant->ratings
        ];
    }
}