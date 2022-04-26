<?php
namespace App\Http\Resources\Frontend\Item;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurant\GetVendorProfile as GetVendor;


class Details extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'            => $this->id ?? '',
            'name'          => $this->name ?? '',
            'restaurant_id' => $this->restaurant_id ?? '',
            'category'      => $this->category->name ?? '',
            'category_id'   => $this->category_id ?? '',            
            'course_type'   => $this->course_type ?? '',
            'ingredients'   => $this->ingredients ?? '',
            'price'         => $this->price ?? '',
            'image'         => $this->image ?? '',
            'discount'      => $this->discount ?? '',
            'vegi'          => $this->vegi ?? '',
            'expertise'     => $this->expert->namespace ?? '',
            'start_date'    => $this->start_date ?? '',
            'end_date'      => $this->end_date ?? '',
            'latitude'      => $this->latitude ?? '',
            'longitude'     => $this->longitude ?? '',
            'description'   => $this->description ?? '',
            'status'        => $this->status ?? '',
            'ratings'        => $this->ratings ?? '',
            'count_ratings'  => $this->count_rating ?? '',
            'restaurant'    => $this->restaurant->name ?? '',            
            'restaurant'  => (new GetVendor($this->restaurant))->resolve()
        ];
    }
}   