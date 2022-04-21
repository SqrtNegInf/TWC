#!/usr/bin/env perl
# Write a script to print 11x11 multiplication table, only the top half triangle.

use strict;
use warnings;
use feature 'say';

my $n = $ARGV[0] || 11;
printf "  x|";
printf (" %3d",$_) for 1..$n;
print "\n---+".("-" x (4*$n))."\n";
for my $x (1..$n) {
    printf("%3d|", $x);
    for my $y (1..$n) {
        if ($x*$y < $x**2) {
            print "    ";
        } else {
            printf (" %3d", $x*$y);
        }
    }
    say "";
}
 
