#!/usr/bin/env perl
use v5.36;

use constant TARGET => 0;

#my $integers = join ',', @ARGV;
#my @L = sort { $a <=> $b } grep {/-?\d+/} split /,/, $integers;
my @L = (-25, -10, -7, -3, 2, 4, 8, 10);

die "At least 3 integers are needed" if @L < 3;

my $triplets;
for my $i (0 .. $#L - 2) {
    for my $j ($i+1 .. $#L - 1) {
        for my $k ($j+1 .. $#L) {
            next unless $L[$i] + $L[$j] + $L[$k] == TARGET;
            my $key = join '#', $L[$i], $L[$j], $L[$k];
            $triplets->{$key}++;
        }
    }
}

print 'Triplets for target '.TARGET."\n";
printf "(%s,%s,%s)\n", split /#/ foreach sort keys %$triplets;
