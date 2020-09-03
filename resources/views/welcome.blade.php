@extends('layouts.app')

@section('content')

    <div class="flex flex-col justify-center min-h-screen py-12 bg-gray-50 sm:px-6 lg:px-8 bg-cover" style="background-image:url('https://source.unsplash.com/random')">
        <div class="container max-w-sm mx-auto px-4 bg-white bg-opacity-50 p-16 text-center">
            <a href="{{ route('collection.new') }}" class="btn px-6 py-3">Collect Game fee</a>
        </div>
    </div>
@endsection
