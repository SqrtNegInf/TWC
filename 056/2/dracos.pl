#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
use Tree::Binary;
use Test::More;

my $tree = Tree::Binary->new(5)
    ->setLeft(Tree::Binary->new(4)
        ->setLeft(Tree::Binary->new(11)
            ->setLeft(Tree::Binary->new(7))
            ->setRight(Tree::Binary->new(2))
        )
    )->setRight(Tree::Binary->new(8)
        ->setLeft(Tree::Binary->new(13))
        ->setRight(Tree::Binary->new(9)
            ->setRight(Tree::Binary->new(1))
        )
    );

is_deeply(pathsum($tree, 22), [5, 4, 11, 2]);

done_testing;

sub pathsum {
    my ($tree, $sum) = @_;
    die "Not a Tree::Binary object" unless $tree && $tree->isa('Tree::Binary');
    my $result;
    $tree->traverse(sub {
        my $t = shift;
        return unless $t->isLeaf;
        my @nodes;
        while ($t) {
            unshift @nodes, $t->getNodeValue;
            $t = $t->getParent;
        }
        $result = \@nodes if sum(@nodes) == $sum;
    });
    return $result;
}

=back
