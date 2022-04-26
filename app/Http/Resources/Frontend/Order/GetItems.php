<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;

class GetItems extends JsonResource
{
    public function toArray($request)
    {   
        return [
           'order_id' => $this->order_id,
           'name' => $this->item->name,
           'qty' => $this->qty,
           'price' => $this->price,
           'sub_total' => $this->sub_total
        ];
    }
}