#!/usr/bin/env perl
use v5.36;

=comment

The BinTree class below is adapted from class BinaryTree used in the solution
to Task #2 of the Perl Weekly Challenge 94.
The implementation of method is_bst() and sub _isBST() is adapted from:
    https://en.wikipedia.org/wiki/Binary_search_tree#Verification
=cut
#==============================================================================

#==============================================================================
{
package BinTreeNode;
#==============================================================================

#------------------------------------------------------------------------------
sub new                                                           # Constructor
#------------------------------------------------------------------------------
{
    my ($class, $value, $parent) = @_;

    my  %self = ( value => $value, parent => $parent,
                  left  => undef,  right  => undef );

    return bless \%self, $class;
}

#------------------------------------------------------------------------------
sub value                                                         # Getter only
#------------------------------------------------------------------------------
{
    my ($self) = @_;

    return $self->{value};
}

#------------------------------------------------------------------------------
sub parent                                                      # Getter/setter
#------------------------------------------------------------------------------
{
    my ($self, $new_parent) = @_;

    if (defined $new_parent)
    {
        $self->{parent} = $new_parent;
    }

    return $self->{parent};
}

#------------------------------------------------------------------------------
sub left                                                        # Getter/setter
#------------------------------------------------------------------------------
{
    my ($self, $new_left) = @_;

    if (defined $new_left)
    {
        $self->{left} = $new_left;
    }

    return $self->{left};
}

#------------------------------------------------------------------------------
sub right                                                       # Getter/setter
#------------------------------------------------------------------------------
{
    my ($self, $new_right) = @_;

    if (defined $new_right)
    {
        $self->{right} = $new_right;
    }

    return $self->{right};
}

#==============================================================================
package BinTree;
#==============================================================================

#------------------------------------------------------------------------------
sub new                                                           # Constructor
#------------------------------------------------------------------------------
{
    my ($class, $value) = @_;

    my  %self = ( root => BinTreeNode->new( $value ) );

    return bless \%self, $class;
}

#------------------------------------------------------------------------------
sub root                                                          # Getter only
#------------------------------------------------------------------------------
{
    my ($self) = @_;

    return $self->{root};
}

#------------------------------------------------------------------------------
sub append_node
#------------------------------------------------------------------------------
{
    my ($self, $depth, $sequence, $value) = @_;

    my  $parent = $self->root;
    my  $m      = 2 ** $depth;
    my  $seq    = $sequence;
    my  $level  = $depth;

    while ($level > 1)
    {
        $m /= 2;

        if ($seq < $m)
        {
            defined   $parent->left  or return 0;
            $parent = $parent->left;
        }
        else
        {
            defined   $parent->right or return 0;
            $parent = $parent->right;
            $seq   -= $m;
        }

        --$level;
    }

    my $new_node = BinTreeNode->new( $value, $parent );

    if ($seq == 0)
    {
        $parent->left(  $new_node );
    }
    else
    {
        $parent->right( $new_node );
    }

    return 1;
}

use POSIX qw( INT_MIN INT_MAX );

#------------------------------------------------------------------------------
sub is_bst
#------------------------------------------------------------------------------
{
    my ($self) = @_;

    return _isBST( $self->root, INT_MIN, INT_MAX );
}

#------------------------------------------------------------------------------
sub _isBST                                                       # Not a method
#------------------------------------------------------------------------------
{
    my ($node, $min, $max) = @_;

    return 1 if !defined $node;
    return 0 if  $node->value < $min || $node->value > $max;

    return _isBST( $node->left,  $min, $node->value - 1 ) &&
           _isBST( $node->right, $node->value + 1, $max );
}

##############################################################################
1;
}

=comment

Perl Weekly Challenge 130
=========================

TASK #2
-------
*Binary Search Tree*

Submitted by: Mohammad S Anwar

You are given a tree.

Write a script to find out if the given tree is Binary Search Tree (BST).

According to [https://en.wikipedia.org/wiki/Binary_search_tree|wikipedia], the
definition of BST:

    A binary search tree is a rooted binary tree, whose internal nodes each
    store a key (and optionally, an associated value), and each has two
    distinguished sub-trees, commonly denoted left and right. The tree
    additionally satisfies the binary search property: the key in each node is
    greater than or equal to any key stored in the left sub-tree, and less than
    or equal to any key stored in the right sub-tree. The leaves (final nodes)
    of the tree contain no key and have no structure to distinguish them from
    one another.

Example 1

 Input:
         8
        / \
       5   9
      / \
     4   6

 Output: 1 as the given tree is a BST.

Example 2

 Input:
         5
        / \
       4   7
      / \
     3   6

 Output: 0 as the given tree is a not BST.

=cut
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=comment

For simplicity, only integers are accepted as node values.

Input is a single string representing the contents of a binary tree in level-
order (i.e., with nodes specified as per a breadth-first traversal). Nodes are
separated by the pipe character ("|"); empty nodes are indicated by adjacent
separators.

See the file BinTree.pm for implementation details.

NOTE: Pretty-printing of the binary tree (as in the Examples) has not been
      implemented.

=cut
#==============================================================================

use strict;
use warnings;
use Const::Fast;
use Regexp::Common qw( number );
#use lib            qw( . );
#use BinTree;

const my $USAGE =>
qq[Usage:
  perl $0 <tree>

    <tree>    Level-order tree representation, e.g. "8|5|9|4|6"\n];

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #$| = 1;
    #print "\nChallenge 130, Task #2: Binary Search Tree (Perl)\n\n";
}

#==============================================================================
MAIN:
#==============================================================================
{
#    my $args = scalar @ARGV;
#       $args == 1
#            or error( "Expected 1 command line argument, found $args" );

    printf "Input:  %s\n",   '8|5|9|4|6';

    my $btree  = build_tree( '8|5|9|4|6' );
    my $is_bst = $btree->is_bst;

    printf "Output: %d as the given tree is %sa BST\n",
        $is_bst ? 1 : 0, $is_bst ? '' : 'NOT ';
}

#------------------------------------------------------------------------------
sub build_tree
#------------------------------------------------------------------------------
{
    my ($tree_rep) = @_;

    # The pipe character "|" is used as the node separator; if a pipe character
    # is followed immediately by another pipe character, the node is empty:
    # i.e., there is no node in this position within the tree. Trailing empty
    # nodes may be omitted, so "a|b|c" is equivalent to "a|b|c|||||".

    my   @nodes = split / \| /x, $tree_rep;
    push @nodes, '' if scalar @nodes == 0;

    for (@nodes)
    {
        / ^ $RE{num}{int} $ /x or error( qq["$_" is not a valid integer] );
    }

    my $btree = BinTree->new( shift @nodes );
    my $depth =  1;
    my $count =  1;
    my $seq   = -1;

    for my $node (@nodes)
    {
        if (++$count == 2 ** ($depth + 1))
        {
            ++$depth;
            $seq = 0;
        }
        else
        {
            ++$seq;
        }

        if ($node ne '')
        {
            $btree->append_node( $depth, $seq, $node )
                or die qq[ERROR: Node "$node" has no parent\n];
        }
    }

    return $btree;
}

#------------------------------------------------------------------------------
sub error
#------------------------------------------------------------------------------
{
    my ($message) = @_;

    die "ERROR: $message\n$USAGE";
}

###############################################################################
