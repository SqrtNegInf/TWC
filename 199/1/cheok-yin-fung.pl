#!/usr/bin/env perl

use v5.36;

sub good_pairs {
    my @a = $_[0]->@*;
    my $ans = 0;
    for my $i (0..$#a) {
        for my $j ($i+1..$#a) {
            $ans++ if $a[$i] == $a[$j];
        }
    }
    return $ans;
}

use Test::More tests=>3;
ok good_pairs([1,2,3,1,1,3]) == 4;
ok good_pairs([1,2,3]) == 0;
ok good_pairs([1,1,1,1]) == 6;
