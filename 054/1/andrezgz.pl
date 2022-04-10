#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-054/
# Task #1
#
# kth Permutation Sequence
# Write a script to accept two integers n (>=1) and k (>=1).
# It should print the kth permutation of n integers.
# For more information, please follow the wiki page.
# https://en.wikipedia.org/wiki/Permutation#k-permutations_of_n
#
# For example, n=3 and k=4, the possible permutation sequences are listed below:
#
# 123
# 132
# 213
# 231
# 312
# 321
#
# The script should print the 4th permutation sequence 231.

use strict;
use warnings;

my ($n, $k) = (3,4);

my $n_max_perm = factorial($n);

my $perm_n = 0;
permute( [1..$n]);

sub permute {
    my $numbers = shift;
    my $perm = shift // '';

    if (!@$numbers){
        print $perm.$/."\n" and exit if (++$perm_n == $k); #finish on kth permutation
        return;
    }

    foreach my $i (0 .. @$numbers-1) {
        my $c = $numbers->[$i];
        my @new_n = grep { $_ != $c } @$numbers;
        permute( \@new_n  , $perm . $c);
    }
    return;
}

sub factorial {
    my $n = shift;
    return 1 if ($n == 0);
    return $n * factorial($n-1);
}

__END__

./ch-1.pl 5 60
32541

./ch-1.pl 5 120
54321

./ch-1.pl 5 121
USAGE: ./ch-1.pl <n> <k>
5 integers have 120 permutations,so <k> should be less than 120
