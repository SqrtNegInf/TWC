#!/usr/bin/env perl

use Modern::Perl;

my $n = 5;
my @a;

for my $i (0 .. $n - 1) { 
    my @b = (0) x $n;
    $b[$i] = 1;

    push(@a, \@b);
}

print "@$_\n" for @a;
