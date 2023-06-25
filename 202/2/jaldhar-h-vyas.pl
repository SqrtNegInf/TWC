#!/usr/bin/env perl
use v5.36.0;

my @vallies;

my @A = (2, 1, 2, 1, 3);
for my $i (0 .. scalar @A - 1) {
    my @valley;
    my $ascending = undef;

    for my $j ($i .. scalar @A - 1) {
        if ($ascending && scalar @valley && $A[$j] < $valley[-1]) {
            $ascending = undef;
            last;
        } elsif (!$ascending && scalar @valley && $A[$j] > $valley[-1]) {
            $ascending = 1;
        }
        push @valley, $A[$j];
    }
    push @vallies, [ @valley ];
}

say join q{, }, @{ (sort { scalar @{$b} <=> scalar @{$a} } @vallies)[0] };
