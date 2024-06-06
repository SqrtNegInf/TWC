#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
# use POSIX qw(Inf);
use Scalar::Util qw(dualvar);
use Test2::V0 -no_srand;

is(max_ones([[0, 1], [1, 0]]), 1, 'Example 1');
is(max_ones([[0, 0, 0], [1, 0, 1]]), 2, 'Example 2');
is(max_ones([[0, 0], [1, 1], [0, 0]]), 2, 'Example 3');

done_testing();

sub max_ones
{
     my $mtr = $_[0];
     my $max = dualvar(0, "placeholder");
     for my $row ( 1 .. $#$mtr + 1 ) # ( 0 .. $#$mtr )
     {
          my $sum = sum(@{$mtr->[$row - 1]});
          if ( $sum > $max )
          {
               $max = dualvar($sum, "$row");
          }
     }
     return $max eq 'placeholder' ? undef : $max . ''; 
}
