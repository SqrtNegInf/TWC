#!/usr/bin/env perl
use v5.36;

my $fn = shift || 20; #  or die "How much numbers?\n";
print join(" ", map 2 * fib($_ + 1) - 1, 0 .. 20), $/;

sub fib
{
     my $n = shift;
     my $x = 0; 
     my $y = 1;

     my $m = 0; 
     while ( $m < $n )
     {
          ($x, $y) = ($y, $x + $y);
          $m++;

     }

     return $x;
}
