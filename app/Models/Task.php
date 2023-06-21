<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use App\Notifications\TaskAssignedNotification;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Task extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = ['title','description','status','user_id'];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }


}
