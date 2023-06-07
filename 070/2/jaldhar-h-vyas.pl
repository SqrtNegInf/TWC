#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars- /;

my $N = shift // 4;

my @code = (0, 1, 3, 2);

if ($N > 2) {
    for my $i (3 .. $N) {
        my @s1 = map { sprintf('%0*b', $i - 1, $_); } @code;
        my @s2 = reverse @s1;
        @s1 = map { "0b0$_"; } @s1; 
        @s2 = map { "0b1$_"; } @s2;
        @code = map { oct $_; } @s1, @s2;
    }
}

say q{[}, (join q{, }, @code), q{]};
