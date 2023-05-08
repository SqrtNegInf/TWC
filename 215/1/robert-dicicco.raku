#!/usr/bin/env raku

my @words = ('abc', 'xyz', 'tsu'),('rat', 'cab', 'dad'),('x', 'y', 'z');

for (@words) -> @wds {
    my $cnt = 0;
    say "Input: \@words = ", @wds;
    for (@wds) -> $w {
        if $w ne $w.comb.sort.join {
            $cnt++;
        }
    }
    say "Output: ", $cnt;
    say " ";
}
