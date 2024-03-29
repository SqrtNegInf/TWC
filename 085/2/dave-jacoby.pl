#!/usr/bin/env perl
use v5.36;

for my $n ( 8, 15, 125 ) {
    say join "\t", $n, two_ints($n),"\n";
}

sub two_ints( $n ) {
    for my $i ( 1 .. $n ) {
        for my $j ( 2 .. $n ) {
            my $exp = $i**$j;
            next if $exp > $n;
            if ( $exp == $n ) {
                say qq{$i ** $j == $exp == $n};
                return 1;
            }
        }
    }
    return 0;
}

