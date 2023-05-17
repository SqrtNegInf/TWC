#!/usr/bin/env perl
use v5.36;

use Test::More;

is(find_prime(10_001), 104743, 'Example');

done_testing;

#
#
# METHODS

sub find_prime {
    my ($count) = @_;

    my $c = 0;
    my $n = 2;
    while ($c <= $count) {
        if (is_prime($n)) {
            return $n if (++$c == $count);
        }
        $n++;
    }
}

sub is_prime {
    my ($n) = @_;

    foreach my $i (2 .. sqrt $n) {
        return 0 unless $n % $i
    }

    return 1;
}
