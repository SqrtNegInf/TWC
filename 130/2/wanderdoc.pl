#!/usr/bin/env perl
use v5.36;


use Struct::Dumb;
use List::Util qw(max); 
struct Node => [qw( left right value )], named_constructor => 1;

my $root = createNode(8);
$root->left = createNode(5);
$root->right = createNode(9);
$root->left->left = createNode(4);
$root->left->right = createNode(6);

print isBST($root, 0, 1e6), $/;

$root = undef;

$root = createNode(5);
$root->left = createNode(4);
$root->right = createNode(7);
$root->left->left = createNode(3);
$root->left->right = createNode(6);
print isBST($root, 0, 1e6), $/;


sub createNode
{
     my $value = $_[0];
     my $node = Node(value => $value, left => undef, right => undef);
     return $node;
}

sub isBST # wikipedia
{
     my ($node, $min, $max) = @_;
     if ( $node )
     {
          return 0 if ( $node->value < $min or $node->value > $max );
          return
               ( isBST($node->left, $min, $node->value)

                 and
               isBST($node->right, $node->value, $max) );
     }
     else
     {
          return 1;
     }
}
