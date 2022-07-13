<?php
namespace App\Http\Resources\Frontend\Restaurant;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Request;
use App\Http\Resources\Frontend\Item\Listing as ItemList;

class GetRestaurant extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'            => $this->id ?? '',            
            'name'         => $this->name ?? '',
            'address'         => $this->address ?? '',
            'zip_code' => $this->zip_code ?? '',
            'cusine_type' => $this->cusine_type ?? '',
            'delivery_time'  => $this->delivery_time ?? '',
            'discount'       => $this->discount ?? '',
            'min_order'       => $this->min_order ?? '',
            'order_type'       => $this->order_type ?? '',
            'serv_distance'       => $this->serv_distance ?? '',
            'latitude'       => $this->latitude ?? '',
            'longitude'       => $this->longitude ?? '',
            'role'       => $this->roles[0]->name ?? '',
            'image'         => $this->image ?? '',
            // 'items'         => ItemList::collection($this->item)->toArray($request)
        ];
    }
}