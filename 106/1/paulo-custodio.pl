#!/usr/bin/env perl
use v5.36;

my @N = <1 3 8 2 0>;
say max_gap(@N);

sub max_gap {
    my(@n) = @_;
    return 0 if @n < 2;
    @n = sort @n;

    my $max_gap = 0;
    for my $i (0..$#n-1) {
        my $gap = $n[$i+1] - $n[$i];
        $max_gap = $gap if $gap > $max_gap;
    }
    return $max_gap;
}
