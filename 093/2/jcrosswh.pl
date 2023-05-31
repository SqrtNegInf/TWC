#!/usr/bin/env perl
use v5.36;

use Tree::Binary;

my ($btree) = Tree::Binary -> new('1')
                -> setLeft
                        (
                                Tree::Binary -> new('0')
                                        -> setLeft(Tree::Binary->new('2') )
                        )
                -> setRight
                        (
                                Tree::Binary->new('9')
                                        -> setLeft(Tree::Binary->new('4') )
                                        -> setRight(Tree::Binary->new('5') )
                        );

print add_paths([], $btree) . "\n";
exit 0;

sub add_paths {
    my ($stack, $node) = @_;
    
    my $total = 0;
    if ($node->isLeaf()) {
        my $total = $node->getNodeValue();
        map { $total += $_; } @{$stack};
        return $total;
    } else {
        push(@{$stack}, $node->getNodeValue());
        $total += add_paths($stack, $node->getLeft()) if $node->hasLeft();
        $total += add_paths($stack, $node->getRight()) if $node->hasRight();
        pop(@{$stack});
    }
    return $total;
}
