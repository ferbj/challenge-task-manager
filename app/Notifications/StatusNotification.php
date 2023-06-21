<?php

namespace App\Notifications;

use App\Models\Task;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Auth;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StatusNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    protected $task;
    public function __construct(Task $task)
    {
        //
        $this->task = $task;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database','mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Update Status')
            ->line($this->task->user->name.' you have been updated the status to: '.$this->task->status)
            ->line('Task: ' . $this->task->title)
            ->action('View Task', route('tasks.show', $this->task));

    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
           'task_id' => $this->task->id,
           'task_title' => $this->task->title,
           'status' => $this->task->status,
           'task_description' => $this->task->description,
           'message' => Auth::user()->name .' The status has been updated to : '.$this->task->status,
           'task_link' => url('/tasks/' . $this->task->id),
        ];
    }
}
