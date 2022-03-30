#!/usr/bin/env raku

sub MAIN(Int :$N = 4) { count-set-bits($N).say }

sub count-set-bits(Int $n) {
    my $c = 0;
    (1..$n).map( -> $i { $c += [+] $i.base(2).comb; });
    return $c % 1000000007;
}
