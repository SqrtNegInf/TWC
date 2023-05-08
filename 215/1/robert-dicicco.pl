#!/usr/bin/env perl
use v5.36;
my @words = (["abc", "xyz", "tsu"],["rat", "cab", "dad"],["x", "y", "z"]);

for my $wds (@words) {
    my $cnt = 0;
    say "Input: \@words = (@$wds)";
    for my $w (@$wds) {
        my $w_sorted = join("",sort(split(//,$w)));
        $cnt++ if ($w ne $w_sorted);
    }
    say "Output: $cnt\n";
}
