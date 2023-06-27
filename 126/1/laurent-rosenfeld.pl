#!/usr/bin/env perl
use v5.36;

my $n = shift // 200;
my $count = scalar grep {not /1/} 2..$n;
say "There are $count integers with no 1 in the 1..$n range";
