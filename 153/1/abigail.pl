#!/usr/bin/env perl
use v5.36;

# Calculate factorials, and sum them.
print   my $sum  = my $fac  = 1;
print ' ', $sum +=    $fac *= $_ for 1 .. 9;
print "\n";
