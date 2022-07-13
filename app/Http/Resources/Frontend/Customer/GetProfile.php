<?php
namespace App\Http\Resources\Frontend\Customer;
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
            'address' => $this->address,
            'latitude' => $this->latitude,
            'longitude' => $this->longitude,
            'country_code' => $this->country_code,
            'image' => $this->image,
            'earning' => $this->earnings,
            'wallet' => $this->wallet
        ];
    }
}