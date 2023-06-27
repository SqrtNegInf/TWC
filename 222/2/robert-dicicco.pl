#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(first_index);

my @allints = (2, 7, 4, 1, 8, 1);

say "Input: \@ints = @allints";
while (1) {
        my @srt = sort(@allints);
        my $ln = scalar @srt;
        if ($ln <= 1) {
            say "Output: $ln";
            exit;
        } else {
            my $lrg = $srt[$ln - 1];
            my $nxt = $srt[$ln - 2];
            my $lrg_index = first_index { $_ eq $lrg } @allints;
            my $nxt_index = first_index { $_ eq $nxt } @allints;
            splice(@allints, $lrg_index, 1);
            splice(@allints, $nxt_index, 1);
            if ($lrg > $nxt){
                unshift(@allints, $lrg - $nxt);
             }
        }
}
