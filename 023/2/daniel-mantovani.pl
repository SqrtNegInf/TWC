#!/usr/bin/env perl
use v5.36;

my $number = 11111;

# and start trying to divide by a factor, starting with 2

my $factor = 2;

while ( $number > 1 ) {
    if ( $number % $factor ) {    # divisibility test: not divisible
        $factor++;

        # following line is an optimization, exlplained below
        $factor = $number unless $factor < sqrt $number;
    }
    else {                        # divisible
        $number /= $factor;

        # now we just print $factor, and a comma or final enter following
        print $number > 1 ? "$factor, " : "$factor\n";
    }
}

# the reason $factor is always a prime number is because of the order we
# are following (ascending order). If $factor wasn't a prime, all of its prime divisors would
# have divide $number before, so we would'n actually have $factor now.

# Also note that if we comment line #23 above, this script will take like forever even for
# not that big factor primes.
# One obvious optimization would be to stop checking when $factor reaches square
# root of current $number, and that's what the mentioned line does
# Even without catching the sqrt calculation (i.e. we are recalculating sqrt on almost every
# iteration) factorizing a prime number like 982451653 on my system improves form 53 seconds when
# I comment that line, to .01 seconds when uncommented
