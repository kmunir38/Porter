<?php
namespace App\Http\Resources\Frontend\Item;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurant\GetVendorProfile as GetVendor;
class Offers extends JsonResource
{
    
    public function toArray($request)
    {   
        return [
            'id'            => $this->id ?? '',
            'name'          => $this->name ?? '',
            'rating'        => $this->ratings ?? '',
            'price'         => $this->price ?? '',
            'image'         => $this->image ?? '',
            'discount'      => $this->discount .' '.'%',
            'start_date'    => $this->start_date ?? '',
            'end_date'      => $this->end_date ?? '',
            'vendor'        => (new GetVendor($this->restaurant ?? $this->grocery))->resolve()
        ];
    }
}