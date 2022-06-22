#!/usr/bin/env raku

use Test;
use Prime::Factor;
#use Expect-brilliant;

my constant @brilliant = gather for 1 … ∞ {
    next if $_ > 14 and $_ %% 2 or .is-prime;
    my @factor = .&prime-factors;
    if @factor.elems == 2 and @factor[0].chars == @factor[1].chars {
        .&take;
    }
}

sub MAIN( Int $n = 20 ) {
    my $out = "\nOutput\n" ~ @brilliant[ 0.. $n - 1 ].join: ', ';
    say $out;
    die "Not as expected." if $n == 20 
            and $out ne
          "\nOutput\n4, 6, 9, 10, 14, 15, 21, 25, 35, 49, 121, 143, "
        ~ "169, 187, 209, 221, 247, 253, 289, 299";
}
