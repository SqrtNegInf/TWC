#!/usr/bin/env raku
srand 1;;

unit sub MAIN(Int:D $x where * > 0 = 20) {
    say 'Array: ', my Int:D @array = (1..$x).roll(10);
    say 'Peak:  ', my Int:D @peak  = @array.kv.map({
        my Bool:D $before = $^k <= 0 || $^v > @array[$^k - 1];
        my Bool:D $after  = $^k >= @array - 1 || $^v > @array[$^k + 1];
        $^v if $before && $after
    });
}
