<div
    x-data="{ amount: '{{ $collection->amount }}', players: '{{ $collection->players }}', per_player: ' {{ $collection->perPlayer() }}' }">

    {{--  AMOUNT --}}
    <div class="mb-6">
        <label for="amount" class="font-bold text-sm">TOTAL AMOUNT</label>

        <input type="text" inputmode="numeric" value="{{ old('amount', $collection->amount) }}" name="amount"
            x-on:keyup='per_player = calculate_per_player(amount, players)'
            class="block rounded-sm border border-orange-200 px-3 py-2" x-model='amount' required>

        @error('amount') <p class="text-red-500">{{ $message }}</p> @enderror
    </div>

    {{--  PLAYERS --}}
    <div class="mb-6">
        <label for="players" class="font-bold text-sm">NUMBER OF PLAYERS</label>

        <input type="text" inputmode="numeric" value="{{ old('players', $collection->players) }}" name="players"
            x-on:keyup='per_player = calculate_per_player(amount, players)'
            class="block rounded-sm border border-orange-200 px-3 py-2" x-model='players' required>

        @error('players') <p class="text-red-500">{{ $message }}</p> @enderror

    </div>

    <div class="mb-6">
        <span class="text-xs">RM</span>
        <span class="font-bold" x-text='per_player'></span>
        <span class="text-sm">/player</span>
    </div>

    <script type="text/javascript">
        function calculate_per_player(amount, players){
            players = players ? players : 1;
            return (amount/players).toFixed(2);
        }
    </script>
</div>
