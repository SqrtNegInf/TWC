#!/usr/bin/env perl
use v5.36;

sub distinct_digits {
    my ($n) = @_;
    my %d;
    @d{split //, $n} = ();
    return keys %d
}

my $n = int sqrt 10234;
while (distinct_digits($n ** 2) < 5) {
    ++$n;
}
say $n ** 2;
