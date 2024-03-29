#!/usr/bin/env perl
use v5.36;

package BTree::Node; # Binary Tree
use Mouse;

has 'value' => (
    is  => 'rw',
    isa => 'Str',
    default => sub { return undef; }
);

has 'left' => (
    is  => 'rw',
    isa => 'Maybe[BTree::Node]',
    default => sub { return undef }
);

has 'right' => (
    is  => 'rw',
    isa => 'Maybe[ BTree::Node]',
    default => sub { return undef }
);

__PACKAGE__->meta->make_immutable();

package main;

# Create the tree
my $root =
    BTree::Node->new(
    	value => 5,
    	left => BTree::Node->new(
    			value => 4,
    			left => BTree::Node->new(
    				value => 11,
    				left => BTree::Node->new(
    					value => 7
    				),
    				right => BTree::Node->new(
    					value => 2,
    				)
    			)
    		),
    	right => BTree::Node->new(
    		value => 8,
    		left => BTree::Node->new(
    			value => 13
    		),
    		right => BTree::Node->new(
    			value => 9,
    			right => BTree::Node->new(
    				value => 1,
    			)
    		)
    	)
    );

my $k = 22;
path_sum($root, $k, 0, '');

sub path_sum {
    my ($node, $k, $total, $path_string) = @_;
    $total += $node->value;
    $path_string .= $node->value;

    # Branch left
    path_sum( $node->left,
              $k,
              $total,
              $path_string . ' → ' )
    if ($node->left);

    # Branch right
    path_sum($node->right,
             $k,
             $total,
             $path_string . ' → ' )
    	if ($node->right);

    # Calculate total if we can't branch
    if ( !$node->left &&
         !$node->right &&
         $total == $k ) {
    	say $path_string;
    }
}

