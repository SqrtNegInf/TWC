#!/usr/bin/env perl
use v5.36;

use List::Util qw/min max/;

my @myints = ([3, 2, 1, 4],[3, 1],[2, 1, 3]);

for my $ints (@myints) {
    say "Input: \@ints = \( @$ints \)";
    print("Output: ");
    if (scalar (@$ints) <= 2 ) {
        say "-1\n";
        next;
    }
    my $min = min(@$ints);
    my $max = max(@$ints);
    print("( ");
    for my $i (@$ints) {
        print("$i ") if ($i > $min and $i < $max);
    }
    say ")\n";
}
