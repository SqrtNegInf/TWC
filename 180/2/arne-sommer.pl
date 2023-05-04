#!/usr/bin/env perl
use v5.36;

my $i = 5;
my @n = (1,9,0,6,2,3,8,5,104,);

say "(", join(",", grep { $_ > $i } @n), ")";
