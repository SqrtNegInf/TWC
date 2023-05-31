#!/usr/bin/env perl
use v5.36;

my %inputs = (
    3 => [1, 2, 3, 4],
    6 => [1, 3, 5, 7],
    10 => [12, 14, 16, 18],
    19 => [11, 13, 15, 17],
);

#INPUT: while (my ($target, $integers) = each %inputs) {
INPUT: for my $target (sort { $a cmp $b} keys %inputs) {
    my $integers = $inputs{$target};
    say "Input: \@N = (@$integers) and \$N = $target";
    for my $i (0 .. $#$integers) {
        if ($integers->[$i] >= $target) {
            say "Output: $i";
            next INPUT;
        }
    }
    say "Output: ", scalar(@$integers);
}
