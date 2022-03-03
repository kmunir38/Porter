<?php
namespace App\Http\Resources\Frontend\Customer;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailsOrder extends JsonResource
{
    public function toArray($request)
    {   

        return [
            'name'      => $this->orders->user->name,
            'address'   => $this->address,
            'spent'     => $this->spent,       
        ];
    }
}