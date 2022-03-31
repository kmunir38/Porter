<?php
namespace App\Http\Resources\Frontend\Notification;
use Illuminate\Http\Resources\Json\JsonResource;

class View extends JsonResource
{
    public function toArray($request)
    {   
        return [
            'id'        => $this->id ?? '',
            'user' => $this->sender->name ?? '',
            'userImage' => $this->sender->image ?? '',
            'title' => $this->title ?? '',
            'content' => $this->content  
        ];
    }
}