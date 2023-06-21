@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Edit Task</div>

                    <div class="card-body">
                        <form action="{{ route('tasks.update', $task) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" name="title" id="title" class="form-control" value="{{ old('title', $task->title) }}">
                                @error('title')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea name="description" id="description" class="form-control">{{ old('description', $task->description) }}</textarea>
                                @error('description')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="not started"{{ old('status'),$task->status === 'not started' ? ' selected' : '' }}>Not Started</option>
                                    <option value="in progress"{{ old('status', $task->status) === 'in progress' ? ' selected' : '' }}>In Progress</option>
                                    <option value="completed"{{ old('status', $task->status) === 'completed' ? ' selected' : '' }}>Completed</option>
                                </select>
                                @error('status')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="user_id">Assigned User</label>
                                <select name="user_id" id="user_id" class="form-control">
                                    <option value="">Unassigned User</option>
                                    @foreach ($users as $user)
                                        <option value="{{ $user->id }}"{{ old('user_id', $task->user_id) === $user->id ? ' selected' : '' }}>{{ $user->name }}</option>
                                    @endforeach
                                </select>
                                @error('user_id')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="mb-2"></div>
                            <div class="row">
                                <div class="col-4">
                                    <button type="submit" class="btn btn-primary">Update Task</button>
                                </div>
                                <div class="col-4">
                                    <a href="{{ url('tasks') }}" class="btn btn-secondary">Task List</a>
                                </div>
                                </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
