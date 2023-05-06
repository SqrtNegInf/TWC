#!/usr/bin/env perl
use v5.36;
use bigint;

sub prod {
    my $prod = 1;
    $prod *= $_ for @_;
    return $prod;
}

my @s = (2);
while (@s < 10) {
    push @s, 1 + prod @s;
}
say for @s;
