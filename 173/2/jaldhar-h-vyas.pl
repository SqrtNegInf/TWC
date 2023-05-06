#!/usr/bin/env perl
use v5.36;
use bigint;

sub product {
    my ($arr) = @_;
    my $total = 1;

    for my $elem (@{$arr}) {
        $total *= $elem;
    }

    return $total;
}

my @sylvesters = (2, 3);

while (scalar @sylvesters< 10) {
    push @sylvesters, product(\@sylvesters) + 1;
}

for (@sylvesters) {
    say;
}
