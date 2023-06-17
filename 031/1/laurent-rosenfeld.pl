#!/usr/bin/env perl
use v5.36;

my ($numerator, $denominator) = (42,0);
my $result;
eval {
    $result = $numerator / $denominator;
};
die "$@" if $@;
say "Result of division is: $result";
