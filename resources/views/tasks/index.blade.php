@extends('layouts.app')
@section('content')

@include('tasks.list', ['tasks'=> $tasks])
@endsection
