<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;

class OrdersArray extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->restaurant->name,
            'image' => $this->restaurant->image,
            'ratings' => $this->restaurant->ratings,
            'address' => $this->restaurant->address,
            'delivered_on' => $this->created_at,
            'commission' => $this->delivery_cost,
            'balance to be paid to porter' => round($this->delivery_cost / 10 * 2),
        ];
    }
}