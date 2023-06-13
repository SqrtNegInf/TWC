#!/usr/bin/env perl
use v5.36;

say for first_n_gapful(shift // 20);

sub is_gapful ($n) { not $n % join '', (split '', $n)[0,-1] }

# Print the first n gapful numbers
sub first_n_gapful {
    my $N = shift;
    my @r;
    for ($_ = 100; @r < $N; $_++) {
        push @r, $_ if is_gapful($_);
    }
    @r;
}
