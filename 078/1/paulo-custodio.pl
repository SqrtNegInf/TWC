#!/usr/bin/env perl
use v5.36;

my @ARGV = <9 10 7 5 6 1>;
my @A = @ARGV;
my $max = 0;
my @leaders;
for my $i (reverse 0..$#A) {
    if ($A[$i] > $max) {
        unshift @leaders, $A[$i];
        $max = $A[$i];
    }
}
@leaders = (0) unless @leaders;
say "(", join(", ", @leaders), ")";
