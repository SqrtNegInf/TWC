#!/usr/bin/env raku

sub prime_pow_fact($p,$n) {
    ($p, $p ** 2, $p ** 3 ...^ * > $n).map({ Int($n/$_) }).sum
}

my $n=125;
say min(prime_pow_fact(2,$n),prime_pow_fact(5,$n));
