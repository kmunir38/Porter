<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Http\Resources\Frontend\Order\GetItems as GetOrderItems;

class GetDetails extends JsonResource
{
    public function toArray($request)
    {   
        return [
           'id' => $this->id ?? '',
           'payment_method' => $this->payment_method ?? '',
           'delivery_address' => $this->address->address ?? $this->customer->address,
           'items' => $this->items_array ?? '',
           'sub_total' => $this->sub_total ?? '',
           'discount' => $this->discount ?? '',
           'delivery_cost' => $this->delivery_cost  ?? '',
           'grand_total' => $this->grand_total ?? '',
            'vat' => $this->vat ?? '',
            'vat_amount' => $this->vat_amount ?? '',
           'is_paid' => (int)$this->payment_status ?? ''
        ];
    }
}