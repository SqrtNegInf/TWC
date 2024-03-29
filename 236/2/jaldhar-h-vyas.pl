#!/usr/bin/env perl
use v5.36;

my @ints = @ARGV;
my %seen;
my $loops = 1;
my $current = 0;

while (scalar keys %seen != scalar @ints) {
    if (exists $seen{$current}) {
        $loops++;

        for my $i (0 .. scalar @ints - 1) {
            if (!exists $seen{$i}) {
                $current = $i;
                last;
            }
        }
    }

    $seen{$current} = 1;
    $current = $ints[$current];
}

say $loops;
