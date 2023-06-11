#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars- /;

my $binary = shift // '100110011';
if ($binary !~ /^[01]+$/) {
    usage();
}

my %lengths;

for my $l (0 .. (length $binary) - 1) {
    for my $r (0 .. (length $binary) - 1) {
        my @digits = split //, $binary;
        for my $i ($l .. $r) {
            $digits[$i]  = ($digits[$i] == '0') ? '1' : '0';
        }

        my $ones = grep /1/, @digits;
         if ($ones) {
            push @{$lengths{$ones}}, [$l, $r];
        }
    }
}

my $max = (sort { $b <=> $a } keys %lengths)[0];
if ($max) {
    for my $pair (@{$lengths{$max}}) {
        say "($pair->[0],$pair->[1])";
    }
}
