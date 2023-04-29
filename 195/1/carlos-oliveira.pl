#!/usr/bin/env perl

use v5.36;

sub specialIntegers {
    my ($limit) = @_;
    return scalar grep { $_ !~ /(.).*\1/; } 1..$limit;
}

print specialIntegers(15), "\n"; # Output: 14
print specialIntegers(35), "\n"; # Output: 32
print specialIntegers(1000), "\n";
