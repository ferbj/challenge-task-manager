
<div class="m-3"></div>
<div class="container">
    @include('notifications.notifiy',['notifications'=> auth()->user()->unreadNotifications])
    <h5>Task List</h3>
    <div class="col-4">
        <a class="btn btn-success" href="{{ url('tasks/create') }}">Add Task</a>
    </div>
    <div class="mb-3"></div>
    <form action="{{ route('tasks.index') }}" method="get">
        <div class="form-group">
            <div class="col-3">
            <label for="status">Filter by Status:</label>
            <select name="status" id="status" class="form-control" onchange="this.form.submit()">
                <option value="">All</option>
                <option value="not started" {{ $status == 'not started' ? 'selected' : '' }}>Not Started</option>
                <option value="pending" {{ $status == 'pending' ? 'selected' : '' }}>Pending</option>
                <option value="completed" {{ $status == 'completed' ? 'selected' : '' }}>Completed</option>
            </select>
        </div>
        </div>
    </form>
    <div class="mb-3"></div>
    <table class="table table-bordered table-striped table-responsive">
        <thead>
            <th>Id</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Assigned User</th>
            <th>Actions</th>
        </thead>
        <tbody>
            @foreach ($tasks as $task)
            <tr>
                <td>{{ $task->id }}</td>
                    <td>{{ $task->title }}</td>
                    <td>{{ $task->description }}</td>
                    <td>{{ $task->status }}</td>

                        @if($task->user)
                        <td>
                            {{ $task->user->name }}
                        </td>
                        @else
                        <td>Unassigned</td>
                        @endif
                    <td>
                        <a href="{{ route('tasks.edit', $task) }}" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        <form action="{{ route('tasks.destroy', $task) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </form>
                    </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    {{ $tasks->links() }}
</div>
