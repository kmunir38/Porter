<?php
namespace App\Http\Resources\Frontend\Rider;
use Illuminate\Http\Resources\Json\JsonResource;

class BalancePage extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->name,
            'image' => $this->image,
            'address' => $this->address,
            'delivery_fee' => 5,
            'estimated_time' => '20-25',
            'ratings' => $this->ratings
        ];
    }
}