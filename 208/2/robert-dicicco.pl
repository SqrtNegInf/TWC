#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;
use feature 'say';

my @nums = ([1,2,2,4],[1,2,3,4],[1,2,3,3]);

for (@nums) {
    my $found = 0;
    my @a = @{$_};
    say "Input: \@nums = (@a)";
    my $ln = scalar @a;
    for my $n (0..$ln-1) {
        if ( $a[$n] != $n+1) {
            say "Output: ($a[$n],",$n+1,')';
            $found = 1;
        }
    }
    if ($found == 0 ) {
        say "Output: -1";
    }
    say " ";
}
