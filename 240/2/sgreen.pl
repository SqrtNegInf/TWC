#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use experimental 'signatures';

sub main (@ints) {
    my @solution = ( map { $ints[ $ints[$_] ] } ( 0 .. $#ints ) );
    say join ', ', @solution;
}

main((0, 2, 1, 5, 3, 4));
