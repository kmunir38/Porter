<?php
namespace App\Http\Resources\Frontend\Rider;
use Illuminate\Http\Resources\Json\JsonResource;

class GetProfile extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'earning' => $this->earnings,
            'deliveries' => $this->deliveries,
            'cancel' => $this->cancel_orders
        ];
    }
}