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
            'Customer' => $this->user->name,
            'Customer Address' => $this->user->address,
            'Order Amount' => $this->grand_total,
            'Order Date' => date('d-m-Y H:i:s', strtotime($this->created_at)),
            // 'User' => (new GetUser($this->restaurent))->resolve()
        ];
    }
}