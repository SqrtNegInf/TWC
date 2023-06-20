#!/usr/bin/env perl
use v5.36;

sub sum_divisors {
    my $x   = shift;
    my $sum = 0;
    for my $d ( 1 .. $x - 1 ) {
        $sum += $d unless $x % $d;
    }
    return $sum;
}

# now we will start calculating sum of divisors for each integer,
# starting by integer 2.
# we will name that integer $candidate, to show that is a potential
# amicable number, and we will try to get the corresponding pair
# and see if they accomplish the given criteria

my $candidate = 2;

while (1) {
    my $candidate2 = sum_divisors $candidate;

    # we will not consider cases where candidates are the same number
    # (that wouldn't be a pair, right?).
    # (Note also that this candidate would be a perfect number, something
    # we saw on challenge 008-1).
    # Also we don't care for candidates that are lower than the one
    # we are checking, as those would have been found before
    if ( $candidate < $candidate2 && $candidate == sum_divisors($candidate2) ) {
        say "Found amicable numbers: $candidate & $candidate2";
        last;    # challenge ask to stop on first match (i.e. smallest pair)
    }
    $candidate++;
}
