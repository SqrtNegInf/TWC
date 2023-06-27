#!/usr/bin/env perl
use v5.36;

use ntheory qw( is_prime );

say join(", ", cuban_primes(1000));

sub cuban_primes {
    my($limit) = @_;
    my @out;
    my $y = 1;
    my $p;
    do {
        $p = 3*$y*$y+3*$y+1;
        if (is_prime($p)) {
            push @out, $p;
        }
        $y++;
    } while ($p < $limit);
    return @out;
}
