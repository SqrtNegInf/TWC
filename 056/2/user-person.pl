#!/usr/bin/env perl
use v5.36;

use Tree::Binary;

my($btree) = Tree::Binary -> new('5')
    -> setLeft(
        Tree::Binary -> new('4')
              -> setLeft (
                  Tree::Binary -> new('11')
                        -> setLeft (Tree::Binary -> new('7'))
                        -> setRight(Tree::Binary -> new('2'))
                  )
    )
    -> setRight (
        Tree::Binary -> new('8')
              -> setLeft (Tree::Binary -> new('13'))
              -> setRight (
                      Tree::Binary -> new('9')
                            -> setRight (
                                Tree::Binary -> new('1'))
                 )
             );

my @branchMemory = ();
my $k = 22;
my $match = 0;
my $toLeafSum = 0;

$btree -> traverse
    (
        sub
            {
                my($tree) = @_;
                $toLeafSum += $tree -> getNodeValue;

                if ( $tree -> hasLeft and $tree -> hasRight ) {
                    push @branchMemory, $toLeafSum;
                }

                if ( $tree->isLeaf) {
                    ++$match if $toLeafSum == $k;
                    $toLeafSum = pop @branchMemory;
                }
          });

if ($match == 0 ) {
    print "No branch equals $k\n";
} elsif ($match == 1) {
    print "1 branch equals $k\n";
} else {
    print "$match branches equal $k\n";
}

__END__
output:

1 branch equals 22
