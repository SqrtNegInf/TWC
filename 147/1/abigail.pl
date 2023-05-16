#!/usr/bin/env perl
use v5.36;

#
# This is asking for the first 20 terms of A024785, which we can just
# grab from https://oeis.org/A024785/list.
#
# Or we port the Python code from https://oeis.org/A024785
#

use Math::Prime::Util qw [is_prime];

my @todo  = qw [2 3 5 7];
my $count = 20;

print "$_ " for @todo;
$count -= @todo;

MAIN: while (@todo) {
    my @next;
    for my $d (1 .. 9) {
        foreach my $p (@todo) {
            my $candidate = "$d$p";
            next unless is_prime ($candidate);
            print "$candidate ";
            last MAIN if -- $count <= 0;
            push @next   => $candidate;
        }
    }
    @todo = @next;
}

print "\n";
