@extends('layouts.app')

@section('content')
<div class="container max-w-md px-4 mx-auto py-8">

    <h1 class="text-2xl mb-6">Unsettled payments
        <span class="text-xs text-gray-300">{{ $payments->count() }}</span>
    </h1>

    <table class="w-full border border-orange-200 ">
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
                        <a href="{{ route('payment.destroy', $payment) }}"
                            class="btn px-2 py-1 bg-transparent text-red-500">delete</a>
                    </div>
                </td>
            </tr>
            @endforeach

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
