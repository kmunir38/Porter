<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;

class AcceptOrderRes extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' 				=> $this->id ?? '',
            'vendor' 			=> $this->restaurant->name ?? $this->grocery->name ?? $this->shopper->name ?? '',
            'vendor_address' 	=> $this->restaurant->address ?? $this->grocery->address ?? $this->shopper->address ?? '',
            'customer_phone'    => $this->customer->phone ?? '',
            'vendor_phone' 		=> $this->restaurant->phone ?? $this->grocery->phone ?? $this->shopper->phone ?? '',
            'cuisine_type'      => $this->restaurant->cuisine_type ?? '',
            'delivery_cost'     => $this->delivery_fee ?? '',
            'average_time'      => $this->average_time ?? '',
            'to_store'          => $this->to_store ?? '',
            'from_store'        => $this->from_store ?? '',
            'customer_rating'   => $this->customer->ratings ?? '',
            'order_items'       => GetOrderItems::collection($this->itemsOrder)->toArray($request) ?? '',
            'sub_total'         => $this->sub_total ?? '',
            'grand_total'       => $this->grand_total ?? '',
            'order_type'        => $this->restaurant->user_role ?? $this->grocery->user_role ?? $this->shopper->user_role ?? '',
            // 'User' => (new GetUser($this->restaurent))->resolve()
        ];
    }
}