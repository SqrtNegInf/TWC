#!/usr/bin/env perl
use v5.36;

use Tree::Binary;

my($btree) = Tree::Binary->new('1')->setLeft( Tree::Binary->new('2')->setLeft(Tree::Binary->new('4'))->setRight(Tree::Binary->new('5')->setLeft(Tree::Binary->new('6'))->setRight( Tree::Binary->new('7') ) ))->setRight(Tree::Binary->new('3'));

$btree->traverse
(
  sub
  {
    my($tree) = @_;
    print " -> " unless $tree->isRoot;
    print $tree->getNodeValue;
  }
);

print "\n";

__END__

perl ch-2.pl
1 -> 2 -> 4 -> 5 -> 6 -> 7 -> 3


