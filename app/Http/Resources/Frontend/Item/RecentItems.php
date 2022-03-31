<?php
namespace App\Http\Resources\Frontend\Item;
use Illuminate\Http\Resources\Json\JsonResource;

class RecentItems extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id' => $this->id ?? '',
            'name' => $this->name ?? '',
            'restaurant' => $this->restaurant->name ?? '',
            'grocery' => $this->grocery->name ?? '',
            'category' => $this->category->name ?? '',
            'ratings' => $this->ratings ?? '',
            'count_ratings' => $this->count_ratings ?? '',
            'image'     =>  $this->image ?? '',
        ];
    }
}