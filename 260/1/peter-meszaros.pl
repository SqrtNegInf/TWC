#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;
use List::Util qw/uniqint/;

my $cases = [
    [1, 2, 2, 1, 1, 3],
    [1, 2, 3],
    [-2, 0, 1, -2, 1, 1, 0, 1, -2, 9],
];

sub unique_occurences
{
    my $l = shift;

    my %h;
    ++$h{$_} for @$l;

    return (uniqint values %h) == (keys %h) ? 1 : 0;
}

is(unique_occurences($cases->[0]), 1, 'Example 1');
is(unique_occurences($cases->[1]), 0, 'Example 2');
is(unique_occurences($cases->[2]), 1, 'Example 3');
done_testing();
