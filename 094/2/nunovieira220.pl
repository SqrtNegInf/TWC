#!/usr/bin/env perl
use v5.36;

use Tree::Binary;

{
package LL;

# The linked list object consists of 3 values;
#  * 'val'  => the value of the node;
#  * 'next' => the next node in the list;
#  * 'last' => the last node in the list; {so can easily add next value}

# Two methods:
#  * ->add( $val ) => Add another value to the end of the list
#  * ->flatten     => Flatten to array of values

sub new {
  my $class = shift;
  my $self = { 'val' => shift, 'next' => undef };
  $self->{'last'} = $self;
  bless $self, $class;
}

sub add {
  my( $self, $val ) =@_;
  my $new = LL->new( $val );
  $self->{'last'}{'next'} = $new;
  $self->{'last'} = $new;
  return $self;
}

sub flatten {
  my $self = shift;
  return $self->{'val'} unless $self->{'next'};
  return ( $self->{'val'}, $self->{'next'}->flatten );
}

1;
}

# Input
my ($btree) = Tree::Binary
  -> new('1')
  -> setLeft (
    Tree::Binary
      -> new('2')
      -> setLeft(Tree::Binary->new('4'))
      -> setRight (
        Tree::Binary
          -> new('5')
          -> setLeft(Tree::Binary->new('6'))
          -> setRight(Tree::Binary->new('7'))
      )
  )
  -> setRight (Tree::Binary->new('3'));

# Output
printLinkedList(createLinkedList($btree));

# Binary Tree to Linked List
sub createLinkedList {
  my ($btree) = @_;
  my $left = $btree -> getLeft;
  my $right = $btree -> getRight;
  my $res = { 'value' => $btree -> getNodeValue, 'next' => undef };

  if(defined $left || defined $right) {
    my $next = $res;

    if(defined $left) {
      $next->{'next'} = createLinkedList($left);

      $next = $next->{'next'} while(defined $next->{'next'});
    }

    if(defined $right) {
      $next->{'next'} = createLinkedList($right);
    }
  }

  return $res;
}

# Print Linked List
sub printLinkedList {
  my ($next) = @_;

  while(defined $next->{'next'}) {
    print $next->{'value'}." -> ";
    $next = $next->{'next'};
  }

  print $next->{'value'};
}
