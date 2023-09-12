#!/usr/bin/env perl
use v5.36;

use List::Util qw/uniq/;
use Algorithm::Combinatorics qw/combinations/;

my @words = ("aba", "aabb", "abcd", "bac", "aabc");
#my @words = ("aabb", "ab", "ba");
my $pairs = 0;
my $cnt = 1;

say "Input: \@words = [@words]";
my $iter = combinations(\@words, 2);
    while (my $c = $iter->next) {
        my $str1 = join("",uniq(sort(split("",@$c[0]))));
        my $str2 = join("",uniq(sort(split("",@$c[1]))));
        if ($str1 eq $str2) {
            say "\tpair$cnt \[@$c[0] @$c[1]\]";
            $pairs++;
            $cnt++;
        }
    }
say("Output: $pairs");
