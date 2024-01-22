#!/usr/bin/env raku

sub factors(Int $n) {
    return  (| (1 .. $n div 2).grep({ $n %% $_ }), $n);
}

sub MAIN(
    @ints = [1, 2, 3, 4]
) {
    factors(@ints.elems).map({ @ints[$_ - 1] ** 2 }).sum.say;
}
