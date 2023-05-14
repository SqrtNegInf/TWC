#!/usr/bin/env perl
use v5.36;

#
# We'll store the tree in a triangular 2-d array, with
# the children on node on position [$d, $k] on positions
# [$d + 1, 2 * $k] and [$d + 1, 2 * $k + 1].
#
# Finding the first node without children is trivial.
#
#TREE: while (<>) {

$_ = '1 | 2 3 | 4 * * 5 | * 6';
TREE: {
    chomp;
    my @tree = map {[map {$_ ne '*'} /\S+/g]} split /\|/;
    foreach my $d (keys @tree) {
        foreach my $i (keys @{$tree [$d]}) {
            if ($tree [$d] [$i] && !$tree [$d + 1] [2 * $i]
                                && !$tree [$d + 1] [2 * $i + 1]) {
                say $d + 1;
                next TREE;
            }
        }
    }
}
