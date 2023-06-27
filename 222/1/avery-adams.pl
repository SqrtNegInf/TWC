#!/usr/bin/env perl
use v5.36;

my @A = (1, 1, 4, 2, 1, 3);
my @sorted = sort @A;
my $matches;
for (my $i = 0; $i <= $#A; $i++) {$matches++ if $A[$i] == $sorted[$i]}
say $matches // 0;
