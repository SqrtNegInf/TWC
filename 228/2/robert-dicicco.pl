#!/usr/bin/env perl
use v5.36;

use List::Util qw/min/;

my @myints = ([3, 4, 2],[1,2,3]);

for my $i (@myints) {
    say "Input: \@int = (@$i)";
    my $cnt = 0;
    while(scalar @$i) {
        my $min = min(@$i);
        if ($i->[0] == $min) {
            shift(@$i);
        } else {
            push(@$i,$i->[0]);
            shift(@$i);
        }
        scalar @$i > 0 ? say "(@$i)" : say "()";
        $cnt++;
    }
    say "Output: $cnt\n";
}
