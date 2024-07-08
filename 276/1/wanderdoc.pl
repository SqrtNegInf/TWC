#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Algorithm::Combinatorics qw(combinations);
use List::Util qw(sum);
use Test2::V0 -no_srand;


is(complete_days(12, 12, 30, 24, 24), 2, 'Example 1');
is(complete_days(72, 48, 24, 5), 3, 'Example 2');
is(complete_days(12, 18, 24), 0, 'Example 3');
done_testing();

sub complete_days
{
     my @hours = @_;
     my $iter = combinations(\@hours, 2);
     my $counter = 0;
     while (my $p = $iter->next) 
     {
          if ( sum(@$p) % 24 == 0 )
          {
               $counter++;
          }
     }
     return $counter;
}
