#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use List::Util qw(reduce);
use Test::More;
is_deeply([aop(5, 2, 1, 4, 3)], [24, 60, 120, 30, 40], 'Example 1');
is_deeply([aop(   2, 1, 4, 3)], [12, 24, 6, 8],        'Example 2');
done_testing();




sub aop
{
     my @arr = @_;
     my @aop = map { my $n = $_; 
                    reduce { $a * $b } @arr[grep { $_ != $n } 0 .. $#arr] } 
               0 .. $#arr;
     return @aop;
}
