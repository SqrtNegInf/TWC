#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;
use List::Util 'min';

my ($size, @a) =  (3, 1, 5, 0, 2, 9, 3, 7, 6, 4, 8);
die "Size is bigger than array" if $size > @a;

my (@win, @mins);
(@win[0..$size-1], @a) = (undef, @a);

while ($#a > -1) {
	shift @win;
	push @win, shift @a;
	push @mins, min (@win);
}
print "@mins\n";
