<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Order\OrdersArray as GetCashHistory;

class CountCashOrders extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'count_order' => $this->cost     
        ];
    }
}