#!/usr/bin/env perl
use 5.024;
use warnings;
use English qw< -no_match_vars >;
use experimental qw< postderef signatures >;
no warnings qw< experimental::postderef experimental::signatures >;
use List::Util 'sum';

my $it = fibonacci_summing();
print $it->() . ' ' for 1 .. (shift || 20);
print "\n";

sub fibonacci_summing {
   my %fibo = (0 => 1);
   my $f = 0;
   my $s = -1;
   return sub {
      while ('necessary') {
         ++$s;
         my $sum = sum split m{}mxs, $s;
         ($f, $fibo{$fibo{$f}}) = ($fibo{$f}, $f + $fibo{$f})
            while $f < $sum;
         return $s if exists $fibo{$sum};
      }
   };
}
