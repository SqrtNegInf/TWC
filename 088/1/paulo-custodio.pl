#!/usr/bin/env perl
use v5.36;

my @N = <5 2 1 4 3>;
my @M = array_product(@N);
say "(", join(", ", @M), ")";

sub array_product {
    my(@n) = @_;
    my @m = (1) x scalar(@n);               # initialize the products to 1
    for my $i (0 .. $#n) {
        for my $j (0 .. $#m) {
            $m[$j] *= $n[$i] if $i != $j;   # multiply if not the same index
        }
    }
    return @m;
}
