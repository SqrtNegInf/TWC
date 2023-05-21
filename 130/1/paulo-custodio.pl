#!/usr/bin/env perl
use v5.36;

my @N = (2, 5, 4, 4, 5, 5, 2);
my %count;
$count{$_}++ for @N;
say $_ for (grep {$count{$_}%2==1} keys %count);
