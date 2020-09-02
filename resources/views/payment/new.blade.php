@extends('layouts.app')

@section('content')
<div class="container px-4 max-w-sm mx-auto">

    <h1 class="text-3xl font-bold">Payment</h1>

    <div class="box mt-2 mb-4 text-sm bg-transparent border-l-4 border-orange-500 text-orange-500">
        <div>TOTAL AMOUNT: {{ $collection->amount }}</div>
        <div>NUMBER OF PLAYERS: {{ $collection->players }}</div>
    </div>

    {{-- TOTAL RECEIVED --}}
    <div class="box px-12 py-4 inline-block mb-12 text-gray-600">
        <span class="text-xs block">Total collected</span>
        <div>
            <span class="text-xs">RM</span>
            <span class="text-2xl text-orange-500">{{ $collection->amountCollected() }}</span>
            <span class="text-xs">/{{ $collection->amount }}</span>
        </div>

        <span class="text-xs">{{ $collection->payments()->count()  }}/{{ $collection->players }} players have paid</span>
    </div>


    <form action="{{ route('payment.store') }}" method="POST">
        @csrf

        <input type="hidden" name="collection_id" value="{{ $collection->id }}">
        {{-- NAME --}}
        <div class="mb-6">
            <label for="name" class="font-bold text-sm">PLAYER NAME</label>
            <input type="text" inputmode="latin-name" value="{{ old('name', $payment->name) }}" class="form-input"
                name="name" required>

                @error('name') <p class="text-red-500">{{ $message }}</p> @enderror
        </div>

        {{-- AMOUNT --}}
        <div class="mb-6 flex items-center -mx-2">
            <div class="w-1/2 overflow-hidden px-2">
                <label for="amount" class="font-bold text-sm">AMOUNT RECEIVED</label>
                <input type="text" inputmode="latin-amount" value="{{ old('amount', $payment->amount) }}"
                    class="form-input w-full" name="amount" required>

                @error('amount') <p class="text-red-500">{{ $message }}</p> @enderror
            </div>

            <div class="w-1/2 px-2 text-xs">
                <div class="">per player</div>
                <div class="">
                    RM
                    <span class="font-bold">
                        {{ $collection->perPlayer() }}</div>
                </span>
            </div>
        </div>

        <div class="mb-6">
            <button type="submit" class="btn" style="min-width: 120px">UPDATE</button>
        </div>

    </form>

    <div class="text-sm">
       <a href="{{ route('unsettled-payment.index', $collection) }}" class="text-blue-500 underline">
            > Unsettled balances (0)
        </a> <br>

       <a href="{{ route('collection.show', $collection) }}" class="text-blue-500 underline">
        > View list
       </a>
    </div>
</div>
@endsection
