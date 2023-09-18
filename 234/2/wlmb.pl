#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);
use List::Util qw(sum0 product);

my @A = (4, 4, 2, 4, 3);
die <<~"FIN" unless @A;
    Usage: $0 N1 [N2...]
    to count the number of unequal triplets in the set {N1 N2...}
    FIN
my %count_for_number;
++$count_for_number{$_} for @A;
my @numbers=keys %count_for_number;
my $result=@numbers<3
    ? 0
    : sum0 map {
	product @count_for_number{@$_}
} combinations(\@numbers,3);
say "@A -> $result",
