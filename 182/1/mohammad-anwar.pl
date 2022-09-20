#!/usr/bin/env perl

# ex 1 fails

use v5.36;
use Test2::V0 -srand => 1;

is max_index(5, 2, 9, 1, 7, 6, 9), 2, 'Example 1';
is max_index(4, 2, 3, 1, 5, 0), 4, 'Example 2';

done_testing;

sub max_index(@n) {
    my $i = 0;
    my %j = map { $i++ => $_ } @n;
    return (sort { $j{$b} <=> $j{$a} } keys %j)[0];
}
