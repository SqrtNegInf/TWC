#!/usr/bin/env perl

use strict;
use warnings;

my @L= (19,11,9,7,20,3,17,16,2,14,1);

print '[' . join(', ', @L) . "]\n\n";

foreach my $i (sort { $a <=> $b } @L) {
    if (scalar(grep {$_ > $i} @L) == $i) {
        print "Noble Integer: $i\n";
        
        # there cannot be multiple in a list because
        # the next greater noble integer nullifies the
        # the previous smaller noble integer
        last;
    }
}
