#!/usr/bin/env raku

sub MAIN (Int $M = 100, Int $N = 500) {
    say common-factors($M, $N).join(' ');
}

sub common-factors (Int $a, Int $b) {
    my $x = $a gcd $b;
    return (1..$x).grep(-> $n { $x %% $n });
}
