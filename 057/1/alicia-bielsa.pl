#!/usr/bin/env perl
use v5.36;

use lib '.';
use Moose;
use BinaryTreeNode;
use BinaryTree;


my @aValuesTree  =(1 , 2 ,3,4,5,6,7);
my $nimberValuesTree = scalar( @aValuesTree);
my $heightBinaryTree =  getHeightFullBinaryTree( $nimberValuesTree);

unless ($heightBinaryTree){
    die "$nimberValuesTree is not a valid number of values for a full binary tree\n";
}

my $oBinaryTree = BinaryTree->new( height => $heightBinaryTree);
$oBinaryTree->addValues(@aValuesTree);
$oBinaryTree->drawBinaryTree();
$oBinaryTree->mirrorTree();
$oBinaryTree->drawBinaryTree();


sub getHeightFullBinaryTree {
    my $numberValues = shift;
    my $height = 1;
    my $total = 1;
    my $valorAnterior =1;
    while  ($numberValues >= $total ){
       $total = $total + $valorAnterior * 2 ;       
       $valorAnterior = $valorAnterior * 2;
       $height++;
       if ($total == $numberValues){
            return $height;  
       }
    }
    return 0;
}


