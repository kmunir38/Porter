<?php
namespace App\Http\Resources\Frontend\Order;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Frontend\Restaurent\GetProfile as GetUser;
use App\Http\Resources\Frontend\Item\Listing as GetItems;
use Carbon\Carbon;
class PastOrder extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id ?? '',
            'vendor_id' => $this->restaurant->id ?? $this->grocery->id ?? $this->shopper->id,
            'vendor_name' => $this->restaurant->name ?? $this->grocery->name ?? $this->shopper->name,
            'customer_name' => $this->customer->name ?? '',
            'customer_image' => $this->customer->image ?? '',
            'customer_address' => $this->address->address ?? $this->customer->address ?? '',
            'vendor_image' => $this->customer->image ?? '',
            'vendor_address' => $this->vendor->address ?? '',
            'rating' => $this->rider->ratings ?? '',
            'order_amount' => $this->grand_total ?? '',            
            'order_date' => $this->created_at ?? '',
            'order_status' => $this->order_status ?? '',
            'items' => $this->items_array ?? '',
            'vat' => $this->vat ?? '',
            'vat_amount' => $this->vat_amount ?? '',
            'confirm_payment' => $this->confirm_payment_proceed ?? '',
            'accepted_byVendor_at' => Carbon::parse($this->accepted_at_vendor)->diffForHumans() ?? '',       
        ];
    }
}   