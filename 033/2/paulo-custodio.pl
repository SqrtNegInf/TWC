#!/usr/bin/env perl
use v5.36;

# header
print "  x|";
printf "%4d", $_ for 1..11;
print "\n";
print "---+", "-"x(11*4), "\n";

# print table
for my $row (1..11) {
    printf "%3d|", $row;
    print " "x(4*($row-1));
    printf "%4d", $row*$_ for $row..11;
    print "\n";
}
