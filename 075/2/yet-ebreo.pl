#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

my @R =  (2, 1, 4, 5, 3, 7);

my @res;
for my $f (@R) {
    my $s = 0;
    for my $e (@R) {
        if ($e >= $f) {
            $s++
        } else {
            push @res, $s * $f;
            $s = 0;
        }
    }
    push @res, $s * $f;
}

#Will work nicely on values < 10
for my $t (-(max @R) .. -1) {
    print -$t;
    say map { $_ >= -$t ? " #" : "  " } @R
}
say "- " x (@R+1);
say "  @R\n";

say max @res




