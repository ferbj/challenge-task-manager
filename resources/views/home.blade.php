@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    <div class="row">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <div class="col-6">
                        <h4>User info</h4>
                    <div class="col-md-6 ">
                        <b>Name:</b> {{Auth::user()->name}}

                    </div>
                    <div class="col-md-8 ">
                        <b>Email:</b> {{Auth::user()->email}}
                    </div>
                    </div>
                    <div class="col-6">
                        <div class="mb-4 mr-3"></div>
                        <a class="btn btn-success" href="{{ url('tasks') }}">Access to manager Task</a>
                    </div>
                </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
