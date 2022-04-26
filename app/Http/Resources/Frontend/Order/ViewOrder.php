<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;

class ViewOrder extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'customer' => $this->customer->name,
            'customer_address' => $this->customer->address,
            'customer_image' => $this->customer->image,            
            'order_items'   => GetOrderItems::collection($this->itemsOrder)->toArray($request),
            'grand_total' => $this->grand_total,
            // 'User' => (new GetUser($this->restaurent))->resolve()
        ];
    }
}