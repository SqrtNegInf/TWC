#!/usr/bin/env perl
use v5.36;

# input: list of numbers, last is the difference
my @N = (10, 8, 12, 15, 5);
my $A = 7;

say found($A, @N);

sub found {
    my($a, @n) = @_;
    for my $i (0 .. $#n-1) {
        for my $j ($i+1 .. $#n) {
            if (abs($n[$i]-$n[$j]) == $a) {
                return 1;
            }
        }
    }
    return 0;
}
