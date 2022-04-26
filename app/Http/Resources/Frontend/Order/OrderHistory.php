<?php
namespace App\Http\Resources\Frontend\Order;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;

class OrderHistory extends JsonResource
{
    public function toArray($request)
    {   
        return [
           'order_id' => $this->id ?? '',
           'name' => $this->restaurant->name ?? '',        
           'sub_total' => $this->ItemsOrder[0]->sub_total ?? '',
           'delivered_at' => $this->completed_at_vendor ?? '',
           'address' => $this->customer->address ?? '',
           'rating' => $this->restaurant->ratings ?? '',
           'image' => $this->restaurant->image ?? '',
        ];
    }
}