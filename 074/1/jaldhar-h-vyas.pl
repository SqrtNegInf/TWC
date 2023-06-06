#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my @A = (1, 2, 2, 3, 2, 4, 2);
if (!scalar @A) {
    usage();
}

my %count;
map { $count{$_}++; } @A;
my $N = int (scalar @A / 2);

my @majority = grep { $count{$_} > $N; } keys %count;

if (!scalar @majority) {
    @majority = (-1);
}

say join q{ }, @majority;
