<?php
namespace App\Http\Resources\Frontend\Item;
use Illuminate\Http\Resources\Json\JsonResource;

class Details extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'            => $this->id,
            'name'          => $this->name,
            'restaurent_id' => $this->restaurent_id,
            'category_id'   => $this->category_id,
            'course_type'   => $this->course_type,
            'ingredients'   => $this->ingredients,
            'image'         => $this->image,
            'discount'      => $this->discount,
            'vegi'          => $this->vegi,
            'expertise'     => $this->expertise,
            'start_date'    => $this->start_date,
            'end_date'      => $this->end_date,
            'latitude'      => $this->latitude,
            'longitude'     => $this->longitude,
            'description'   => $this->description,
            'status'        => $this->status,
        ];
    }
}