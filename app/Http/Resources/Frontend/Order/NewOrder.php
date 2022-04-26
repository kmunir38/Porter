<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;


class NewOrder extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'restaurant_name' => $this->restaurant->name,
            'restaurant_address' => $this->restaurant->address,
            'restaurant_image' => $this->restaurant->image,            
            'customer_rating' => $this->customer->ratings,            
            'delivery_fee' => "5$",            
            'estimated_time' => "20-25",           
            'order_items'   => GetOrderItems::collection($this->itemsOrder)->toArray($request),
            'grand_total' => $this->grand_total += $this->delivery_cost, 
            // 'delivery_cost' => $this->delivery_cost, 
        ];
    }
}   