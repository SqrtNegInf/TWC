#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

no warnings 'uninitialized';

my @matrix = ();
my $array = $ARGV[0];
if ($array < 0 or $array > 2) { say "Error! arg must be between 0 and 2 inclusive";exit};

if ($array == 0) {
    @matrix = ((3, 1, 2), (5, 2, 4), (0, 1, 3));
} elsif ($array == 1) {
    @matrix = ((2, 1), (4, 5));
} elsif ($array == 2) {
    @matrix = ((1, 0, 3), (0, 0, 0), (1, 2, 1));
} else {
    # should never get here!
}

my @out = ();


print "Input: \@matrix = ";
for (@matrix) {
    print "$_";
    for my $val ($_) {
        push(@out, $val);
    }
}
say " ";
@out = sort(@out);
say "Output: $out[2]";
