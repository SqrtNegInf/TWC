#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars- /;

my @numbers = sort (1,2,3,4);
my @wave;

my $mid = (scalar @numbers) / 2;
my $end = (scalar @numbers) - 1;

for my $i (0 .. $mid - 1) {
    push @wave, $numbers[$end--];
    push @wave, $numbers[$i];
}
if (scalar @numbers % 2) {
    push @wave, $numbers[$mid];
}

say join q{,}, @wave;

