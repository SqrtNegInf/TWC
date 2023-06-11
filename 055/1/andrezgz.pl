#!/usr/bin/env perl
use v5.36;

my $binary = 100110011;
my $d = (length $binary) - 1;

my $max = 0;
my @solution;

for my $l (0 .. $d) {
    my @digits = split //,$binary;
    for my $r ($l .. $d) {

        $digits[$r] = $digits[$r] ? 0 : 1; #invert

        my $ones = grep { $_ } @digits;
        next if $ones < $max;

        if ($ones > $max) {
            $max = $ones;
            @solution = { l => $l, r => $r };
        }
        else {
            push @solution, { l => $l, r => $r };
        }
    }
}

printf '(L=%d, R=%d)'.$/, $_->{l}, $_->{r} for @solution;
