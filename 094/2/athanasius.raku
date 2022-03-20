#!/usr/bin/env raku

###############################################################################
=begin comment

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

=end comment
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=begin comment

Input is a single string representing the contents of a binary tree in level-
order (i.e., with nodes specified as per a breadth-first traversal). Nodes are
separated by the pipe character ("|"); empty nodes are indicated by adjacent
separators.

If no command-line arguments are given, the script runs pre-set tests to verify
correct operation.

=end comment
#==============================================================================

#use lib < . >;
#use BinaryTree;
class BinaryTree {
#==============================================================================

#------------------------------------------------------------------------------
my class Node
#------------------------------------------------------------------------------
{
    has Any  $.value;
    has Node $.parent is rw;
    has Node $.left   is rw;
    has Node $.right  is rw;
}

has Node $!root;

#------------------------------------------------------------------------------
submethod BUILD( Any:D :$value )
#------------------------------------------------------------------------------
{
    $!root = Node.new( value => $value, parent => Nil,
                       left  => Nil,    right  => Nil );
}

#------------------------------------------------------------------------------
method append-node( UInt:D $depth, UInt:D $sequence, Str:D $value --> Bool:D )
#------------------------------------------------------------------------------
{
    my Node $parent = $!root;
    my UInt $m      = 2 ** $depth;
    my UInt $seq    = $sequence;
    my UInt $level  = $depth;

    while $level > 1
    {
        $m = ($m / 2).Int;

        if $seq < $m
        {
            $parent.left.defined  or return False;
            $parent = $parent.left;
        }
        else
        {
            $parent.right.defined or return False;
            $parent = $parent.right;
            $seq   -= $m;
        }

        --$level;
    }

    my Node $new-node = Node.new( value => $value, parent => $parent,
                                  left  => Nil,    right  => Nil );

    if $seq == 0
    {
        $parent.left  = $new-node;
    }
    else
    {
        $parent.right = $new-node;
    }

    return True;
}

#------------------------------------------------------------------------------
method traverse-preorder( Callable:D $visit )
#------------------------------------------------------------------------------
{
    if $!root.defined
    {
        preorder( $!root, $visit );
    }
}

#------------------------------------------------------------------------------
sub preorder( Node:D $node, Callable:D $visit )
#------------------------------------------------------------------------------
{
    $visit( $node.value );

    preorder( $node.left,  $visit ) if $node.left\.defined;
    preorder( $node.right, $visit ) if $node.right.defined;
}

}

class SinglyLinkedList {

#------------------------------------------------------------------------------
my class Node
#------------------------------------------------------------------------------
{
    has Any  $.value;
    has Node $.next is rw;
}

has Node $.head is rw;

#------------------------------------------------------------------------------
submethod BUILD( :$value )
#------------------------------------------------------------------------------
{
    if $value.defined
    {
        $!head = Node.new( value => $value, next => Nil );
    }
}

#------------------------------------------------------------------------------
method append( Any $value )
#------------------------------------------------------------------------------
{
    if $value.defined && $value ne ''
    {
        my Node $new-node = Node.new( value => $value, next => Nil );

        if $!head.defined
        {
            my Node $current = $!head;

            $current = $current.next while $current.next.defined;
        
            $current.next = $new-node;
        }
        else
        {
            $!head = $new-node;
        }
    }
}

#------------------------------------------------------------------------------
method display( --> Str:D )
#------------------------------------------------------------------------------
{
    my Str $display;

    if $!head.defined
    {
        my Bool $first = True;

        loop (my Node $node = $!head; $node.defined; $node = $node.next)
        {
            $display ~= ' -> ' unless $first;
            $first    = False;
            $display ~= $node.value;
        }
    }
    else
    {
        $display = '(empty)';
    }

    return $display;
}

}

##############################################################################
my constant @TESTS =
            {
                input       => '1|2|3|4|5|||||6|7',
                expected    => '1 -> 2 -> 4 -> 5 -> 6 -> 7 -> 3',
                description => 'Example'
            },
            {
                input       => 'a|b|c|d|e|f|g|h|i|j|k|l|m|n|o',
                expected    => 'a -> b -> d -> h -> i -> e -> j -> k -> ' ~
                               'c -> f -> l -> m -> g -> n -> o',
                description => 'Perfect tree of depth 3'
            },
            {
                input       => '',
                expected    => '(empty)',
                description => 'Empty tree'
            };

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #"\nChallenge 094, Task #2: Binary Tree to Linked List (Raku)\n".put;
}

#==============================================================================
sub MAIN
(
    Str $tree?            #= Level-order tree representation, e.g. "a|b|c|d||e"
)
#==============================================================================
{
    if $tree.defined
    {
        my BinaryTree       $btree = build-tree( $tree );
        my SinglyLinkedList $sll   = SinglyLinkedList.new;

        $btree.traverse-preorder( sub ( Any:D $val ) { $sll.append( $val ) } );
        $sll.display.put;
    }
    else
    {
        test;
    }
}

#------------------------------------------------------------------------------
sub build-tree( Str:D $tree-rep --> BinaryTree:D )
#------------------------------------------------------------------------------
{
    # The pipe character "|" is used as the node separator; if a pipe character
    # is followed immediately by another pipe character, the node is empty:
    # i.e., there is no node in this position within the tree. Trailing empty
    # nodes may be omitted, so "a|b|c" is equivalent to "a|b|c|||||".

    my Str        @nodes = $tree-rep.split: '|';
    my BinaryTree $btree = BinaryTree.new( value => @nodes.shift );
    my UInt       $depth =  1;
    my UInt       $count =  1;
    my Int        $seq   = -1;

    for @nodes -> Str $node
    {
        if ++$count == 2 ** ($depth + 1)
        {
            ++$depth;
            $seq = 0;
        }
        else
        {
            ++$seq;
        }

        if $node ne ''
        {
            $btree.append-node( $depth, $seq, $node )
                or do
                   {
                       qq[ERROR: Node "$node" has no parent].put;
                       exit;
                   };
        }
    }

    return $btree;
}

#------------------------------------------------------------------------------
sub test()
#------------------------------------------------------------------------------
{
    use Test;
    plan @TESTS.elems;

    for @TESTS -> %test
    {
        my BinaryTree       $btree = build-tree( %test<input> );
        my SinglyLinkedList $sll   = SinglyLinkedList.new;

        $btree.traverse-preorder( sub ( Any:D $val ) { $sll.append( $val ) } );

        my Str              $got   = $sll.display;

        is( $got, %test<expected>, %test<description> );
    }
}

#------------------------------------------------------------------------------
sub USAGE()
#------------------------------------------------------------------------------
{
    my Str $usage = $*USAGE;

    $usage ~~ s/ ($*PROGRAM-NAME) /raku $0/;
    $usage.put;
}

##############################################################################
