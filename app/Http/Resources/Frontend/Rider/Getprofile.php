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
            'image' => $this->image,
            'address' => $this->address,
            'latitude' => (float)$this->latitude,
            'longitude' => (float)$this->longitude,
            'earning' => $this->earnings,
            'country_code' => $this->country_code,
            'deliveries' => $this->rider_deliveries,
            'cancel' => $this->cancel_orders,
            'zip_code' => $this->zip_code,
            'description' => $this->description,
            'dob' => $this->dob,
            'identity' => $this->identity,
            'id_image' => $this->id_image,
            'cancel' => $this->cancel_orders,
            'ratings' => $this->ratings
        ];
    }
}