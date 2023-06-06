#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

my @a =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8, 3);
my $s = pop @a;
my @out = map { min @a[$_..$_+$s-1] } 0..(@a-$s);
say "@out";
