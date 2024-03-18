#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -srand => 1;

is(unique_occurences(1,2,2,1,1,3), 1, 'Example 1');
is(unique_occurences(1,2,3), 0, , 'Example 2');
is(unique_occurences(-2,0,1,-2,1,1,0,1,-2,9), 1, 'Example 3');
done_testing();

sub unique_occurences
{
     my @arr = @_;
     my %values;
     do { $values{$_}++ } for @arr;
     my %unique;
     @unique{values %values} = undef;
     return (scalar keys %unique == scalar keys %values) ? 1 : 0;
}
