#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars- /;


my ($C, $O, $S) = (3, 4, 'perlandraku');
my $N = length $S;

if ($C < 1 || $O < 1 || $C > $O || $C + $O > $N) {
    usage();
}

my @chars = split //, $S;
for my $i (1 .. $C) {
    my $a = $i % $N;
    my $b = ($i + $O) % $N;
    my $temp = $chars[$a];
    $chars[$a] = $chars[$b];
    $chars[$b] = $temp;
}

say join q{}, @chars;
