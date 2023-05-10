#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use List::Util qw< sum >;

say sum_rec((1,3,5,7,9));

sub sum_rec {
    my $first = shift;
    my $sum = 0;
    @_ ? sum_rec(map { $sum += $_ } @_) : $first;
}
