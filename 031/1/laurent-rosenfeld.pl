#!/usr/bin/env perl
use strict;
use warnings;
use feature qw/say/;

my ($numerator, $denominator) = (42,0);
my $result;
eval {
    $result = $numerator / $denominator;
};
die "$@" if $@;
say "Result of division is: $result";
