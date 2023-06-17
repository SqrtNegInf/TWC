#!/usr/bin/env perl
use v5.36;

my $max   = shift || 11;         # multiplication table size
my $width = length($max**2) + 1; # control spacing
my $cell  = "%${width}s";        # cell format

print sprintf $cell,$_ for ('x|', 1 .. $max), "\n";     # column headers
print '-' x ($width-1), '+', '-' x ($width*$max), "\n"; # separation line
for my $row (1 .. $max) {                               # row
    printf $cell, $row.'|';                             ## row header
    for my $col (1 .. $max) {                           ## column
        printf $cell, $col >= $row ? $row * $col : '';  ### cell value
    }
    print "\n";
}
