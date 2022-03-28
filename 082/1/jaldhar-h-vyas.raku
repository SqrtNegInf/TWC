#!/usr/bin/env raku

sub factors(Int $n) {
    return  (1 .. $n div 2).grep({ $n %% $_ });
}

sub MAIN(Int $M = 100, Int $N = 500) {
    (factors($M) ∩ factors($N)).keys.sort.join(', ').say;
}
