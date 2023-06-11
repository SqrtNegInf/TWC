#!/usr/bin/env perl
use v5.36;

sub collatz {
    my ($start) = @_;
    my @seq = $start;
    push @seq, ($seq[-1] / 2, 3 * $seq[-1] + 1)[$seq[-1] % 2]
        while $seq[-1] != 1;
    return @seq
}

my @sizes;
push @sizes, [$_, scalar collatz($_)] for 1 .. 1e4;
say "@$_" for (sort { $b->[1] <=> $a->[1] } @sizes)[0 .. 5];

use Test::More;
is_deeply [collatz(23)],
[23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1];
done_testing();
