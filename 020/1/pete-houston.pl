#!/usr/bin/env perl

use strict;
use warnings;

my @chars = split //, 'bookkeeper';
my @out = shift @chars;
while (my $next = shift @chars) {
    if (substr ($out[-1], 0, 1) eq $next) {
        $out[-1] .= $next;
    } else {
        push @out, $next;
    }
}
print "Result is @out\n";
