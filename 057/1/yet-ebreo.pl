#!/usr/bin/env perl
use v5.36;

my @tree = (1, [2, [4],[5]], [3, [6] ,[7]]);
sub treverse {
    my ($tree,$depth,$rev) = @_;
    if (!$rev) {
        if ($depth) {
            print (("   " x $depth)."|");
            print (("---" x $depth));
        } 
        printf "  %03d\n", $tree->[0];
    }
    if ($tree->[1]) {
        treverse ($tree->[1], $depth+1, $rev);
        if ($tree->[2]) {
            treverse ($tree->[2], $depth+1, $rev);
            if ($rev) {
                ($tree->[1],$tree->[2]) = ($tree->[2],$tree->[1]);
            }
        } 
    }
}
treverse(\@tree, 0, 1);
#print in a not so pretty way :D
treverse(\@tree, 0, 0);
