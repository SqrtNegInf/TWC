#!/usr/bin/env raku

#sub MAIN(
#    $chars, *@words
#) {

my @words = ("cat", "bt", "hat", "tree"); my $chars="atach",
    my @chars = $chars.comb;
    @words
        .map({ $_.comb })
        .grep({ @$_ ⊆ @chars })
        .map({ @$_.elems })
        .sum
        .say;
#}
