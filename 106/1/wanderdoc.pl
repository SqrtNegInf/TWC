#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);
use Test::More;

sub max_gap
{
     my @arr = @_;
     return 0 if scalar @arr < 2;
     @arr = sort {$b <=> $a} @arr;

     my $gap = max( map { $arr[$_] - $arr[$_ + 1] } 0 .. $#arr - 1 );
     return $gap;
}


is(max_gap(2, 9, 3, 5), 4, 'Example 1');
is(max_gap(1, 3, 8, 2, 0), 5, 'Example 2');
is(max_gap(5), 0, 'Example 3');

done_testing();
