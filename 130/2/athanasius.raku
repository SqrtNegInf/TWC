#!/usr/bin/env raku

###############################################################################
=begin comment

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

=end comment
###############################################################################


#==============================================================================
=begin comment

The BinTree class below is adapted from class BinaryTree used in the solution
to Task #2 of the Perl Weekly Challenge 94.

The implementation of methods is-bst() and !isBST() is adapted from:

    https://en.wikipedia.org/wiki/Binary_search_tree#Verification

=end comment
#==============================================================================

#==============================================================================
class BinTree {
#==============================================================================

#------------------------------------------------------------------------------
my class Node
#------------------------------------------------------------------------------
{
    has Int  $.value;
    has Node $.parent is rw;
    has Node $.left   is rw;
    has Node $.right  is rw;
}

has Node $!root;

#------------------------------------------------------------------------------
submethod BUILD( Int:D :$value )
#------------------------------------------------------------------------------
{
    $!root = Node.new( value => $value, parent => Nil,
                       left  => Nil,    right  => Nil );
}

#------------------------------------------------------------------------------
method append-node( UInt:D $depth, UInt:D $sequence, Int:D $value --> Bool:D )
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
method is-bst( --> Bool:D )
#------------------------------------------------------------------------------
{
    return self!isBST( $!root, -Inf, +Inf );
}

subset Int-or-Inf where Int:D | -Inf | +Inf;

#------------------------------------------------------------------------------
method !isBST
(
    Node         $node,
    Int-or-Inf:D $min,
    Int-or-Inf:D $max
--> Bool:D
)
#------------------------------------------------------------------------------
{
    return True  if !$node.defined;
    return False if  $node.value < $min || $node.value > $max;

    return self!isBST( $node.left,  $min, $node.value - 1 ) &&
           self!isBST( $node.right, $node.value + 1, $max );
}

##############################################################################
}

#==============================================================================
=begin comment

For simplicity, only integers are accepted as node values.

Input is a single string representing the contents of a binary tree in level-
order (i.e., with nodes specified as per a breadth-first traversal). Nodes are
separated by the pipe character ("|"); empty nodes are indicated by adjacent
separators.

See the file BinTree.rakumod for implementation details.

NOTE: Pretty-printing of the binary tree (as in the Examples) has not been
      implemented.

=end comment
#==============================================================================


#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #"\nChallenge 130, Task #2: Binary Search Tree (Raku)\n".put;
}

#==============================================================================
sub MAIN
(
    Str:D $tree = "8|5|9|4|6"
)
#==============================================================================
{
    "Input:  $tree".put;

    my BinTree $btree  = build-tree( $tree );
    my Bool    $is-bst = $btree.is-bst;

    "Output: %d as the given tree is %sa BST\n".printf:
        $is-bst ?? 1 !! 0, $is-bst ?? '' !! 'NOT ';
}

#------------------------------------------------------------------------------
sub build-tree( Str:D $tree-rep --> BinTree:D )
#------------------------------------------------------------------------------
{
    # The pipe character "|" is used as the node separator; if a pipe character
    # is followed immediately by another pipe character, the node is empty:
    # i.e., there is no node in this position within the tree. Trailing empty
    # nodes may be omitted, so "a|b|c" is equivalent to "a|b|c|||||".

    my Str @s-nodes = $tree-rep.split: '|', :skip-empty;

    for @s-nodes
    {
        val( $_ ).^name eq 'IntStr'
            or do
               {
                   qq[ERROR: Node value "$_" is not an integer].put;
                   exit;
               }
    }

    my Int     @nodes = @s-nodes.map: { .Int };
    my BinTree $btree = BinTree.new( value => @nodes.shift );
    my UInt    $depth =  1;
    my UInt    $count =  1;
    my Int     $seq   = -1;

    for @nodes -> Int $node
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
sub USAGE()
#------------------------------------------------------------------------------
{
    my Str $usage = $*USAGE;

    $usage ~~ s/ ($*PROGRAM-NAME) /raku $0/;
    $usage.put;
}

##############################################################################
