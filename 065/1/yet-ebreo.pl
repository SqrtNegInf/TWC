#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my $digits = 2;
my $sum    = 10;

for my $x (glob "{1,2,3,4,5,6,7,8,9,0}" x $digits) {
    my $s = eval $x=~s/\B/\+/gr;
    (length (int $x) == $digits) && ($s == $sum) && say $x
}
