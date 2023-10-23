#!/usr/bin/env perl
use v5.36;

no warnings 'experimental::smartmatch';

my @strings = ([ ["ad", "bd", "aaab", "baa", "badab"],
                 "ab",
               ],
               [ ["a", "b", "c", "ab", "ac", "bc", "abc"],
                 "abc"
               ],
               [ ["cc", "acd", "b", "ba", "bac", "bad", "ac", "d"],
                 "cad"
               ]
              );
foreach my $arr (@strings) {
    my $times = 0;
    my @allowed = split //, $arr->[1];
    foreach my $word (@{$arr->[0]}) {
        my $right = 1;
        foreach my $letter (split //, $word) {
            unless ($letter ~~ @allowed) {
                $right = 0;
                last;
            }
        }
        $times++
            if $right;
    }
    printf "strings (%s) -> allowed %s \nOutput: %d\n",
        (join ', ', @{$arr->[0]}),
        $arr->[1],
        $times;
}
