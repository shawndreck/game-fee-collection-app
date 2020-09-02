@extends('layouts.app')

@section('content')
<div class="container mx-auto max-w-sm px-4 pt-8">

    <h1 class="text-3xl mb-6">Set up</h1>
    <div cass="mt-8">
        <x-collection.edit :collection=$collection />

        <button class="mt-6 inline-block rounded px-3 py-2 bg-orange-500 text-white hover:bg-orange-600 text-xs font-bold">START COLLECTING</button>


    </div>
</div>
@endsection