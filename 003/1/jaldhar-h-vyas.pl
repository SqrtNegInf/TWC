#!/usr/bin/env perl
use v5.36;

sub isSmooth {
    my ($num) = @_;

    # get the divisors that _aren't_ multiples of 2, 3, or 5
    my @divisors = grep { ($_ % 2 != 0) && ($_ % 3 != 0) && ($_% 5 != 0) }
                   (grep { $num % $_ == 0 } (1 .. $num));

    # 1 is always a divisor so the array will always have atleast one member.
    return scalar @divisors == 1;
}

say join q{ }, grep { isSmooth($_) } (1 .. 50);
