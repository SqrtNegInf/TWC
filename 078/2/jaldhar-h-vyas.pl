#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub rotate {
    my ($n, $arr) = @_;
    my @arr = @{$arr};

    for (1 .. $n) {
        push @arr, shift @arr;
    }

    return @arr;
}

my @A = (10,20,30,40,50); my @B = (3,4);

map { say q{[}, (join q{ }, rotate($_, \@A)), q{]}; } @B;
