#!/usr/bin/env perl
use v5.36;

my @ARGV = <9 10 7 5 6 1>;
my @a = @ARGV;
my $max;
my @out;

for (my $i = $#a; $i >= 0; $i--) {
    if (!defined $max || $a[$i] > $max) {
        unshift @out, $a[$i];
        $max = $a[$i];
    }
}

say "@out";
