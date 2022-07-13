<?php
namespace App\Http\Resources\Frontend\Notification;
use Illuminate\Http\Resources\Json\JsonResource;

class View extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'    => $this->id ?? '',
            'order_id'        => $this->trigger_id ?? '',
            'sender_name'  => $this->sender->name ?? '',
            'sender_image' => $this->sender->image ?? '',
            'title' => $this->title ?? '',
            'content' => $this->message,  
            'deliver_time' => $this->created_at->diffForHumans()
        ];
    }
}