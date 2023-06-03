#!/usr/bin/env perl
use v5.36;

#    You are given an array of positive numbers @N.
#    Write a script to represent it as Histogram Chart and find out
#    how much water it can trap.
#

use List::Util qw [max];

#
# Read the input, extract the numbers, store them in @N, and find the maximum.
#
my $max = max my @N = <DATA> =~ /[0-9]+/g;

my $w = length $max;   # Width of the largest number, so we
                       # we can align things properly.

#
# Print histograms. We're counting down from the maximum volume to 1,
# and for each index, if the volume on given index equals, or exceeds
# the current volume, we print a #, else, we print a space. 
# 
for (my $volume = $max; $volume; $volume --) {
    printf  "%${w}d" => $volume;
    printf " %${w}s" => $N [$_] >= $volume ? "#" : " " for keys @N;
    print "\n";
}

#
# Print the line with bars.
#
my $bar = "_" x $w;
print $bar, " $bar" x @N, "\n";

#
# Print the sums (just the values in @N)
#
print " " x $w;
printf " %${w}d" => $_ for @N;
print "\n";


__END__
2 1 4 1 2 5
