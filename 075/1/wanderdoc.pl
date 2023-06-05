#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations_with_repetition);
use List::Util qw(sum);

sub coin_change
{
     my($coins, $sum) = @_;
     my @arr = sort {$a<=>$b} @$coins;

     my $counter = 0;

     for my $k ( 1 ..  $sum/$arr[0])
     {
          my $iter = combinations_with_repetition(\@arr, $k);
          while (my $p = $iter->next)
          {
               print join(': ', ++$counter, join('+', @$p)), $/ if sum(@$p) == $sum;
          }
     }
     print "No solution for [@arr] and ${sum}.$/" and return unless $counter;
     print "There are ${counter} possible ways to make sum ${sum}.$/";
}



#coin_change([100, 50, 20, 10, 5], 100);
coin_change([1, 2, 4], 6);
coin_change([2, 10, 20], 15);
