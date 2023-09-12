#!/usr/bin/env perl
use v5.36;

use List::Util qw/ uniq sum0 /;
use Algorithm::Combinatorics qw(combinations);

my @multi_words = (
    ["aba", "aabb", "abcd", "bac", "aabc"],
    ["aabb", "ab", "ba"],
    ["nba", "cba", "dba"]
);

foreach my $words (@multi_words) {
    printf "%s -> %d\n", (join ' ', map { $_ } @$words),
                         sum0 map { break_it_down($_->[0])
                                    eq
                                    break_it_down($_->[1])
                                      ? 1
                                      : ()
                                  } combinations($words, 2);
}

sub break_it_down {
    return join '', sort { $a cmp $b } uniq split //, shift;
}
