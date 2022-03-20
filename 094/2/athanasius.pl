#!/usr/bin/env perl

###############################################################################
=comment

Perl Weekly Challenge 094
=========================

Task #2
-------
*Binary Tree to Linked List*

Submitted by: Mohammad S Anwar

You are given a binary tree.

Write a script to represent the given binary tree as an object and flatten it
to a linked list object. Finally print the linked list object.

Example:

    Input:

        1
       / \
      2   3
     / \
    4   5
       / \
      6   7

    Output:

        1 -> 2 -> 4 -> 5 -> 6 -> 7 -> 3

=cut
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=comment

Input is a single string representing the contents of a binary tree in level-
order (i.e., with nodes specified as per a breadth-first traversal). Nodes are
separated by the pipe character ("|"); empty nodes are indicated by adjacent
separators.

If no command-line arguments are given, the script runs pre-set tests to verify
correct operation.

=cut
#==============================================================================

use strict;
use warnings;
use Const::Fast;

#use lib qw( . );
#use BinaryTree;

#==============================================================================
{
package BinTreeNode;

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
package BinaryTree;
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

#------------------------------------------------------------------------------
sub traverse_preorder
#------------------------------------------------------------------------------
{
    my ($self, $visit) = @_;

    if (defined $self->root)
    {
        preorder( $self->root, $visit );
    }
}

#------------------------------------------------------------------------------
sub preorder
#------------------------------------------------------------------------------
{
    my ($node, $visit) = @_;

    $visit->( $node->value );

    preorder( $node->left,  $visit ) if defined $node->left;
    preorder( $node->right, $visit ) if defined $node->right;
}


}

#use SinglyLinkedList;

{
package ListNode;
#==============================================================================

#------------------------------------------------------------------------------
sub new                                                           # Constructor
#------------------------------------------------------------------------------
{
    my ($class, $value) = @_;

    my  %self = ( value => $value, next => undef );

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
sub next                                                        # Getter/setter
#------------------------------------------------------------------------------
{
    my ($self, $new_next) = @_;

    if (defined $new_next)
    {
        $self->{next} = $new_next;
    }

    return $self->{next};
}

#==============================================================================
package SinglyLinkedList;
#==============================================================================

#------------------------------------------------------------------------------
sub new                                                           # Constructor
#------------------------------------------------------------------------------
{
    my ($class, $value) = @_;

    my  %self = ( head => undef );

    if (defined $value)
    {
        $self{head} = ListNode->new( $value );
    }

    return bless \%self, $class;
}

#------------------------------------------------------------------------------
sub head                                                        # Getter/setter
#------------------------------------------------------------------------------
{
    my ($self, $new_head) = @_;

    if (defined $new_head)
    {
        $self->{head} = $new_head;
    }

    return $self->{head};
}

#------------------------------------------------------------------------------
sub append
#------------------------------------------------------------------------------
{
    my ($self, $value) = @_;

    if (defined $value && $value ne '')
    {
        my $new_node = ListNode->new( $value );

        if (defined $self->head)
        {
            my $current = $self->head;

            $current = $current->next while defined $current->next;
        
            $current->next( $new_node );
        }
        else
        {
            $self->head( $new_node );
        }
    }
}

#------------------------------------------------------------------------------
sub display
#------------------------------------------------------------------------------
{
    my ($self) = @_;
    my  $display;

    if (defined $self->head)
    {
        my $first = 1;

        for (my $node = $self->head; defined $node; $node = $node->next)
        {
            $display .= ' -> ' unless $first;
            $first    = 0;
            $display .= $node->value;
        }
    }
    else
    {
        $display = '(empty)';
    }

    return $display;
}

}

const my $USAGE =>
"Usage:
  perl $0 [<tree>]

    [<tree>]    Level-order tree representation, e.g. \"a|b|c|d||e\"\n";

const my @TESTS =>
         (
             {
                 input       => '1|2|3|4|5|||||6|7',
                 expected    => '1 -> 2 -> 4 -> 5 -> 6 -> 7 -> 3',
                 description => 'Example'
             },
             {
                 input       => 'a|b|c|d|e|f|g|h|i|j|k|l|m|n|o',
                 expected    => 'a -> b -> d -> h -> i -> e -> j -> k -> ' .
                                'c -> f -> l -> m -> g -> n -> o',
                 description => 'Perfect tree of depth 3'
             },
             {
                 input       => '',
                 expected    => '(empty)',
                 description => 'Empty tree'
             }
         );

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    $| = 1;
    print "\nChallenge 094, Task #2: Binary Tree to Linked List (Perl)\n\n";
}

#==============================================================================
MAIN:
#==============================================================================
{
    my $args = scalar @ARGV;

    if    ($args == 0)
    {
        test();
    }
    elsif ($args == 1)
    {
        my $btree = build_tree( $ARGV[0] );
        my $sll   = SinglyLinkedList->new;

        $btree->traverse_preorder( sub { $sll->append( $_[0] ) } );
        print $sll->display, "\n";
    }
    else
    {
        print $USAGE;
    }
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

    my $btree = BinaryTree->new( shift @nodes );
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
sub test
#------------------------------------------------------------------------------
{
    use Test::More;
    plan tests => scalar @TESTS;

    for my $test (@TESTS)
    {
        my $btree = build_tree( $test->{input} );
        my $sll   = SinglyLinkedList->new;

        $btree->traverse_preorder( sub { $sll->append( $_[0] ) } );

        my $got   = $sll->display;

        is( $got, $test->{expected}, $test->{description} );
    }
}

###############################################################################
