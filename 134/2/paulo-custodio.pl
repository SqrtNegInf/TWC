#!/usr/bin/env perl
use v5.36;

my($m, $n) = (5, 5);
my %terms;
for my $a (1..$m) {
    for my $b (1..$n) {
        my $prod = $a*$b;
        $terms{$prod} = 1;
    }
}
say scalar(keys %terms);
