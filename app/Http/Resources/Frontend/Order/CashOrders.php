<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Order\OrdersArray as GetCashHistory;
use App\Http\Resources\Frontend\Order\CountCashOrders as getCountCashOrders;

class CashOrders extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->name,
            'image' => $this->image,
            'address' => $this->address,
            'delivery_fee' => 5,
            'estimated_time' => 20 .'to'. 25,
            'ratings' => $this->ratings,
            'sum_orders' => $this->sum_orders,            
            'orders' => GetCashHistory::collection($this->order)->toArray($request),            
        ];
    }
}