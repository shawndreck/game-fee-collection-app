@extends('layouts.app')

@section('content')
<div class="container max-w-md px-4 mx-auto py-8">

    <div class="flex mb-6">
        <div>
            <h1 class="text-2xl">List of payments </h1>
            <span class="text-xs px-2 py-1 text-orange-400 font-bold">
                {{ $payments->count() }}/{{ $collection->players }}
                collected
            </span>
            <span class="text-xs text-orange-400 font-bold">(RM{{ $collection->amountRemaining() }} remaining)</span>
        </div>
        <div class="text-right pl-4 flex-1 text-sm mt-2">
            <a href="{{ route('collection.edit', $collection) }}" class="underline text-blue-600">edit</a>
        </div>
    </div>

    <table class="w-full border border-orange-200 mb-6">
        <thead class="bg-orange-200 text-orange-400 ">
            <tr class="text-xs">
                <th class="py-1">PLAYER NAME</th>
                <th>AMOUNT RECEIVED</th>
                <th>&nbsp;</th>
            </tr>
        </thead>

        <tbody>
            @foreach($payments->get() as $payment)

            <tr class="{{ $loop->even  ? 'bg-orange-100' : 'bg-white' }}">
                <td class="px-2 py-2">{{ $payment->name }}</td>
                <td>
                    <span class="text-xs font-bold">RM</span>
                    {{ $payment->amount }}

                    @php $balance = $collection->perPlayer() - $payment->amount @endphp
                    <span class="text-xs @if((int)$balance > 0)  text-red-500 @else text-green-500 @endif">
                        {{ ($balance > 0 ? '-' : '+') . abs($balance) }}
                    </span>
                </td>
                <td>
                    <div class="flex flex-no-wrap">
                        <a href="{{ route('payment.edit', $payment) }}" class="btn px-2 py-1">edit</a>

                        <form action="{{ route('payment.destroy', $payment) }}" method="POST">
                            @csrf
                            @method('delete')

                            <button type="submit" class="btn px-2 py-1 bg-transparent text-red-500">delete</button>
                        </form>
                    </div>
                </td>
            </tr>
            @endforeach

            @if($payments->count())
            <tr class="bg-white">
                <td colspan="2" class="p-3 bg-white">
                    <div>TOTAL</div>
                </td>
                <td>
                    <div class="font-bold">
                        <span class="text-xs">RM</span>
                        <span class="text-xl">
                            {{ $payments->sum('amount')}}
                        </span>
                    </div>
                </td>
            </tr>
            @endif

            @unless($payments->count())
            <tr>
                <td colspan="3">
                    no data
                </td>
            </tr>
            @endif



            @if($collection->players > $payments->count())

            <tr>
                <td colspan="3" class="text-center py-4">
                    <a href="{{ route('payment.new', $collection) }}" class="btn">Add new payment</a>
                </td>
            </tr>
            @endif
        </tbody>
    </table>

</div>
@endsection
