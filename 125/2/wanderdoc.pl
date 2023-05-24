#!/usr/bin/env perl
use v5.36;

use Struct::Dumb;
use List::Util qw(max); 
struct Node => [qw( left right value )], named_constructor => 1;;


sub createNode
{
     return Node(value => $_[0], left => undef, right => undef);
}


sub height_iter
{
     my $node = $_[0];

     my @queue;
     push @queue, $node;
     my $height = 0;


     while ( @queue )
     {
          my $size = scalar @queue;
          for my $i ( 0 .. $size - 1 )
          {
               my $n = shift @queue;
               push @queue, $n->left if $n->left;
               push @queue, $n->right if $n->right;

          }
          $height++;
     }
     return $height;
}

sub diameter_iter
{

     my $node = $_[0];
     my @queue;
     push @queue, $node;

     my $diameter = 0;

     while ( @queue )
     {

          my $size = scalar @queue;

          for my $i ( 0 .. $size - 1 )
          {
               my $n = shift @queue;
               my $height_left  = $n->left ?  height_iter( $n->left )  : 0;
               my $height_right = $n->right ? height_iter( $n->right ) : 0;
               $diameter = max($diameter, $height_left + $height_right); # + 1

               push @queue, $n->left  if $n->left;
               push @queue, $n->right if $n->right;
          }
     }
     return $diameter;
}




my $root = createNode(1);
$root->left = createNode(2);
$root->left->left = createNode(3);
$root->left->right = createNode(4);
$root->right = createNode(5);
$root->right->left = createNode(6);
$root->right->right = createNode(7);


my $seven = $root->right->right;

$seven->left = createNode(8);
$seven->left->left = createNode(9);
$seven->right = createNode(10);

print diameter_iter($root), $/;
