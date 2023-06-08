#!/usr/bin/env perl
use v5.36;

for my $n ( 63..82 ) {
    say join "\t", $n, power_integers($n);
}

sub power_integers( $n = 9 ) {
    my $o = int 1 + sqrt($n);
    if ( $o > 1 ) {
        for my $i ( 2 .. $o ) {
            my $nn = $n;
            my $c  = 0;
            while ( $nn % $i == 0 ) {
                $nn /= $i;
                $c++;
                return join '^', $i, $c if $nn == 1;
            }
        }
    }
    return 0;
}
