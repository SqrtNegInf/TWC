#!/usr/bin/env perl
use v5.36;

use Set::Intersection;
use List::Util qw/uniqstr/;
sub cs {
    my @str = $_[0]->@*;
    my @allowed = split "", $_[1];
    my $result = 0;
    for my $string (@str) {
        my @arr = uniqstr split "", $string;
        my @int = get_intersection(\@arr, \@allowed);
        my @check_ss = get_intersection(\@arr, \@int);
        $result++ if 
            (join "", sort {$a cmp $b} @check_ss)
                  eq
            (join "", sort {$a cmp $b} @arr);
    }
    return $result;
}

use Test::More tests=>3;
ok cs(["ad", "bd", "aaab", "baa", "badab"], "ab") == 2;
ok cs(["a", "b", "c", "ab", "ac", "bc", "abc"], "abc") == 7;
ok cs(["cc", "acd", "b", "ba", "bac", "bad", "ac", "d"], "cad") == 4;

