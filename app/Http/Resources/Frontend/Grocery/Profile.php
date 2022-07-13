<?php

namespace App\Http\Resources\Frontend\Grocery;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Item\GetByCategory as GetCategory;

class Profile extends JsonResource
{
   public function toArray($request)
    {   
        return [
            'id'        => $this->id ?? '',
            'name'      => $this->name ?? '',
            'email'     => $this->email ?? '',
            'phone'     => $this->phone ?? '',
            'earning'   => $this->earning ?? '',
            'shopper'   => $this->shopper ?? '',
            'all_items'  => $this->item ?? '', 
        ];
    }
}
