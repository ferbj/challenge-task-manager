
@foreach (Auth::user()->unreadNotifications as $notification)
    <div class="notification alert-info">
        <h5>{!! $notification->data['message'] !!}</h5>
        @if(isset($notification->data['task_link']))
        <p><a href="{{ $notification->data['task_link'] }}">View Task</a></p>
        @endif
        @php
            $notification->markAsRead();
        @endphp
    </div>
@endforeach

