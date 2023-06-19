#!/usr/bin/env perl
use v5.36;

my $e = 1; # this will be our final value. We already have the first "1" on it
my $n = 1; # this will be the term number, incrementing after we add a new term
my $t = 1; # this is current term. It will be divided by $n to get following one

# we will stop calculation when $t is so small it is considered as a 0 by Perl internal
# math
while ($t) {
    $t /= $n++;    # calculate new term. Also we increment $n for next step
    $e += $t;      # and just keep adding new terms
}
say $e;
