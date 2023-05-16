#!/usr/bin/env perl
use v5.36;

#
# Not sure what the restriction that both numbers are of the same
# length is going to buy us anything. We don't buy anything from
# the fact the input consists of digits only either.
#

my $LENGTH = 51;

my ($fib_prev, $fib_last) = (1234, 5678);
#while (<>) {
#    my ($fib_prev, $fib_last) = /[0-9]+/g;
    while (length ($fib_last) < $LENGTH) {
        ($fib_prev, $fib_last) = ($fib_last, $fib_prev . $fib_last);
    }
    say substr $fib_last, $LENGTH - 1, 1;
#}
