#!/usr/bin/env perl
use v5.36;

my @in = <5 2 1 4 3>;

my $prod = 1;
$prod *= $_ for @in;

my @out;
push @out, $prod/$_ for @in;
print "@out\n";
