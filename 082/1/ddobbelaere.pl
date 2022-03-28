#!/usr/bin/env perl

use v5.30;
use warnings;
use experimental 'smartmatch';

sub common_factors {
    my ($M, $N) = @_;
    grep {!($N%$_ || $M%$_)} (1..$M);
}

# Tests.
while (<DATA>) {
    next if /^#/;
    /\(([^\)]*)\) \(([^\)]*)\)/;
    my ($M, $N) = split /,/, $1;
    my @expected = split /,/, $2;

    my @actual = common_factors($M, $N);
    say "@actual";
    @expected ~~ @actual || die "Error for (M,N)=($M,$N). Expected @expected, got @actual.";
}

# Console interface.
say join ', ', common_factors(@ARGV) if @ARGV;

__DATA__
# Test data.
(12, 18) (1, 2, 3, 6)
(18, 12) (1, 2, 3, 6)
(18, 23) (1)
(23, 18) (1)
