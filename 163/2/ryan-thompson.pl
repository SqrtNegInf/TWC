#!/usr/bin/env perl

use 5.010;
use warnings;
use strict;
use List::Util qw< sum >;
no warnings 'uninitialized';

say sum_rec((1,3,5,7,9));

sub sum_rec {
    my $first = shift;
    my $sum = 0;
    @_ ? sum_rec(map { $sum += $_ } @_) : $first;
}
