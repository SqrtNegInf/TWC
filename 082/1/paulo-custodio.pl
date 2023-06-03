#!/usr/bin/env perl
use v5.36;

my($M, $N) = (100, 500);
my @common = common_factors($M, $N);
say "(", join(", ", @common), ")";

sub common_factors {
    my($a, $b) = @_;
    my @common;
    for (my $i = 1; $i <= $a || $i <= $b; $i++) {
        if (($a % $i)==0 && ($b % $i)==0) {
            push @common, $i;
        }
    }
    return @common;
}
