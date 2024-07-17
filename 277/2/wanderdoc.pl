#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);
use List::Util qw(min);
use Test2::V0 -no_srand;

is(strong_pairs(1, 2, 3, 4, 5), 4, 'Example 1');
is(strong_pairs(5, 7, 1, 7), 1, 'Example 2');
done_testing();

sub strong_pairs
{
     my @arr = @_;
     @arr = sort { $a <=> $b } @arr;
     my %output;
     my $iter = combinations(\@arr, 2);
     while (my $p = $iter->next) 
     {
          my ($x, $y) = @$p;
          if ( abs($x - $y) > 0 and abs($x - $y) < min($x, $y) )
          {
               # print join(" ", $x, $y), $/;
               $output{ join(" ", $x, $y) }++;
          }
     }
     return scalar keys %output;
}
