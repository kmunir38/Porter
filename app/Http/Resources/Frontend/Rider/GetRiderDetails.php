<?php
namespace App\Http\Resources\Frontend\Rider;
use Illuminate\Http\Resources\Json\JsonResource;

class GetRiderDetails extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->name,            
            'image' => $this->image,
            'address' => $this->address,
            'delivery_fee' => 5,
            'estimated_time' => "20 to 25",
            'ratings' => $this->ratings,
        ];
    }
}