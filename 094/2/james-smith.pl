#!/usr/bin/env perl

use strict;

use warnings;
use feature qw(say);
use Test::More;
#use lib '.';
#use Tree;


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


{
package Tree;
#use LL;

## The tree is stored in an array ref
# The first element is the value of the node
# The remainder of the array are child sub-trees
#
# Methods:
#  ->add_child( $child_tree )
#  ->to_ll( $list )           -- convert tree into linked lit ( if list is
#                                passed then they are added to the end of this list )
#  ->flatten                  -- flatten list to array.
#

sub new {
  my $class = shift;
  my $value = shift;
  my $self = [ $value ];
  bless $self, $class;
}

sub add_child {
  my( $self,$child ) = @_;
  push @{$self}, $child;
  return $self;
}

sub to_ll {
  my( $self, $ll ) = @_;
  my ($v,@sub) = @{$self};
  unless( $ll ) {
    $ll = LL->new( $v );
  } else {
    $ll->add( $v );
  }
  $_->to_ll($ll) foreach @sub;
  return $ll;
}

sub flatten {
  my $self = shift;
  my ($v,@sub) = @{$self};
  return ( $v, map { $_->flatten } @sub );
}

1;
}
my $x = Tree->new(1)->add_child(
          Tree->new(2)->add_child(
            Tree->new(4)
          )->add_child(
            Tree->new(5)->add_child(
              Tree->new(6)
            )->add_child(
              Tree->new(7)
            )
          )
        )->add_child(
          Tree->new(3)
        );
## Check the tree flattens directly
is( (join ' -> ', $x->flatten ), '1 -> 2 -> 4 -> 5 -> 6 -> 7 -> 3' );
## Check the linked list generated from the tree flattens correctly
is( (join ' -> ', $x->to_ll->flatten ), '1 -> 2 -> 4 -> 5 -> 6 -> 7 -> 3' );

done_testing();

