#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(permutations combinations);

my @myints = ([4, 4, 2, 4, 3],[1, 1, 1, 1, 1],[4, 7, 1, 10, 7, 4, 1, 1]);

foreach my $i (@myints) {
    say "Input: \@ints = [@$i]";
    my $cnt = 0;
    my $iter = combinations($i, 3);
    while (my $c = $iter->next) {
            if ((@$c[0] != @$c[1]) && (@$c[1] != @$c[2]) && (@$c[0] != @$c[2])){
                $cnt++;
            }
    }
    say "Output: $cnt\n";
}
