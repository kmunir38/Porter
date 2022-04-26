<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;


class GetLatest extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'                => $this->id ?? '',
            'customer_name'     => $this->customer->name ?? '',
            'restaurant_name'   => $this->restaurant->name ?? '',
            'grocery_name'      => $this->grocery->name ?? '',
            'shopper_name'      => $this->shopper->name ?? '',
            'sub_total'         => $this->sub_total ?? '',
            'grand_total'       => $this->grand_total ?? '',
            'discount'          => $this->discount ?? '',
            'order_status'      => $this->order_status ?? '',            
            'payment_method'    => $this->payment_method ?? '',            
            'address_id'        => $this->address ?? '',            
            'delivery_cost'     => $this->delivery_cost ?? '', 
            'Items'             => GetOrderItems::collection($this->itemsOrder)->toArray($request), 
        ];
    }
}   

