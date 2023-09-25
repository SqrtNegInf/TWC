#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(uniq);
use Scalar::Util qw(dualvar);
use Test::More;

sub remove_one
{
     my @arr = @_;
     my @idx = 0 .. $#arr;
     for my $i ( @idx )
     {
           my @cand = @arr[grep {$_ != $i} @idx];
           if ( join(" ", @cand) eq join(" ", sort {$a <=> $b } uniq @cand )  )
           {
               return dualvar( $arr[$i], 'true' );
           }
     }
     return 'false';
}

is_deeply(remove_one(0, 2, 9, 4, 6), 'true', 'Example 1');
is_deeply(remove_one(5, 1, 3, 2), 'false', 'Example 2');
is_deeply(remove_one(2, 2, 3), 'true', 'Example 3');
done_testing;
