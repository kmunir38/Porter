<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;

use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;

class PastOrder extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id,
            'name' => $this->user->name,
            'address' => $this->user->address,
            'image' => $this->item->image,
            'rating' => $this->rider->ratings,
            'order_amount' => $this->grand_total,            
            'order_date' => $this->created_at,
        ];
    }
}