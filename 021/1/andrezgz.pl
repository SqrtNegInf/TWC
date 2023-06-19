#!/usr/bin/env perl
use v5.36;

my $e_aprox = 0;
my $fact = 1;
for (1, 1 .. 100) { #tricky - additional 1 to represent 0!
    $fact *= $_;
    $e_aprox += 1/$fact;
}

print $e_aprox;
