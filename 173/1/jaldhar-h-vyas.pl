#!/usr/bin/env perl
use 5.030;
use warnings;
use English qw/ -no_match_vars /;

sub isEsthetic {
    my ($n) = @_;
    my @digits = split //, $n;

    for my $i (0 .. scalar @digits - 2) {
        if (abs($digits[$i] - $digits[$i + 1]) != 1) {
            return undef;
        }
    } 

    return 1;
}

my ($n) = 5456;

say "$n is ", isEsthetic($n) ? q{} : 'not ', 'an esthetic number';
