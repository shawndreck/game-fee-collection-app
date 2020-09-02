@extends('layouts.app')

@section('content')
<div class="container mx-auto max-w-sm px-4 pt-8">

    <h1 class="text-3xl mb-6">Edit collection details</h1>
    <div cass="mt-8">

        <form action="{{ route('collection.update', $collection) }}" method="POST">
            @csrf
            @method('patch')

            <x-collection.edit :collection=$collection />
            <div class="flex items-center">
                <button
                    class="mt-6 inline-block rounded px-3 py-2 bg-orange-500 text-white hover:bg-orange-600 text-xs font-bold mr-6">START
                    COLLECTING
                </button>

                <a href="{{ route('collection.show', $collection) }}" class="underline text-orange-500 text-sm">View list of
                    payments</a>
            </div>

        </form>

    </div>
</div>
@endsection
