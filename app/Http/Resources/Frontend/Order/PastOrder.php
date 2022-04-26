<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use Carbon\Carbon;
class PastOrder extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id ?? '',
            'name' => $this->customer->name ?? '',
            'image' => $this->customer->image ?? '',
            'address' => $this->customer->address ?? '',
            'rating' => $this->rider->ratings ?? '',
            'order_amount' => $this->grand_total ?? '',            
            'order_date' => $this->created_at ?? '',
            'order_status' => $this->order_status ?? '',
            'accepted_byVendor_at' => Carbon::parse($this->accepted_at_vendor)->diffForHumans()  ?? '',            
        ];
    }
}   