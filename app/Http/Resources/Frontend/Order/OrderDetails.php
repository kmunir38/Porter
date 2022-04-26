<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;

use App\Http\Resources\Frontend\Customer\GetProfile as GetUser;

class OrderDetails extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'        => $this->id,
            'items'     => $this->item->name,
            'price'     => $this->item->price,
            'qty'       => $this->qty,
            'sub_total' => $this->sub_total,
            'total'     => $this->orders->grand_total, 
            'spent'     => $this->orders->customer->spent,
            'user'      => (new GetUser($this->orders->customer))->resolve()
        ];
    }
}