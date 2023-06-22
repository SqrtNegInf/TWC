#!/usr/bin/env perl
use v5.36;

my $n = 100; #any less won't give a 5 digit number when squared
my @digits;
do {
    @digits = ();
    map { $digits[$_] = 1 } split //, ++$n**2;
} until ( 5 == grep $_, @digits);
print $n**2; #12769
