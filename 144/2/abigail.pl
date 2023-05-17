#!/usr/bin/env perl
use v5.36;

use List::Util qw [min];

sub ulam ($u1, $u2) {
    my @seen = ($u1,  $u2);
    my %sums = ($u1 + $u2, 1);

    my $next;
    while (%sums) {
        $next = min keys %sums;  # A heap saves a factor N/log N, but
                                 # who cares about performance when we
                                 # just want to do the first 10 numbers?
        next if delete $sums {$next} > 1;
        push   @seen => $next;
        return @seen if @seen >= 10;

        $_ == $next || $sums {$_ + $next} ++ foreach @seen;
    }
}



$, = ", ";
say ulam /[0-9]+/g for '1 2', '2 3', '2 5';

