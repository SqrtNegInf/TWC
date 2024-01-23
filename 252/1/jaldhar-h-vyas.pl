#!/usr/bin/env perl
use v5.36;

sub factors {
    my ($n) = @_;

    return grep { $n % $_ == 0; } 1 .. $n / 2, $n;
}

sub sum {
    my $total;
    for my $n (@_) {
        $total += $n;
    }

    return $total;
}

my @ARGV = (1, 2, 3, 4);
say sum(map { $ARGV[$_ - 1] ** 2 } factors(scalar @ARGV));
