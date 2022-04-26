<?php
namespace App\Http\Resources\Frontend\Restaurant;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Request;

class GetVendorProfile extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'                => $this->id,
            'name'              => $this->name,
            'email'             => $this->email,
            'phone'             => $this->phone,
            'address'           => $this->address,
            'latitude'          => $this->latitude,
            'longitude'         => $this->longitude,
            'cuisine_type'      => $this->cuisine_type,
            'image'             => $this->image,
            'earning'           => $this->earnings,
            'ratings'           => $this->ratings,
            'count_ratings'     => $this->count_ratings,
        ];
    }
}