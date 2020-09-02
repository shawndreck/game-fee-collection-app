<div x-data="{ amount: '{{ $amount }}', players: '{{ $players }}', per_players: ' {{ $amount/($players ?? 1) }}' }">

    <input type="text" inputmode="numeric" value="{{ $amount }}">
{{ $amount }}
</div>
