package BinaryTree;

use strict;
use warnings;
use Data::Dumper qw(Dumper);
use feature qw(say);

## The tree is stored in an array ref
# The first element is the value of the node
# The remainder of the array are child sub-trees
#
# Methods:
#  ->add_child( $child_tree )
#  ->flatten                  -- flatten list to array.
#

sub new {
  my $class = shift;
  my $value = shift;
  my $self = [ $value, undef, undef ];
  bless $self, $class;
}

sub ancestors {
  my $self = shift;
  my $x = $self;
  my @ancestors;
  while($x->has_parent) {
    push @ancestors, $x;
    $x = $x->parent;
  }
  return @ancestors;
}
sub max_length {
  my $self = shift;
  my $d = 0;
     $d = $self->left->max_length if $self->has_left;
  return 1+$d unless $self->has_right;
  my $t = $self->right->max_length;
  return $t > $d ? 1+$t : 1+$d;
}

sub diameter {
  my $self = shift;
  my $global = { 'diameter' => 0 };
  $self->walk( sub {
    my $d = ($_[0]->has_left  ? $_[0]->left->max_length  : 0 ) +
            ($_[0]->has_right ? $_[0]->right->max_length : 0 );
    $_[1]{'diameter'} = $d if $d > $_[1]->{'diameter'};
  }, $global );
  return $global->{'diameter'};
}

sub value {
  my $self = shift;
  return $self->[0];
}

sub left {
  my $self = shift;
  return $self->[1];
}

sub parent {
  my $self = shift;
  return $self->[3];
}

sub has_parent {
  my $self = shift;
  return defined $self->[3];
}

sub right {
  my $self = shift;
  return $self->[2];
}

sub has_left {
  my $self = shift;
  return defined $self->[1];
}

sub has_right {
  my $self = shift;
  return defined $self->[2];
}

sub update {
  my( $self, $val ) = @_;
  $self->[0] = $val;
  return $self;
}

sub add_child_left {
  my( $self,$child ) = @_;
  $self->[1] = $child;
  $child->[3] = $self;
  return $self;
}

sub add_child_right {
  my( $self,$child ) = @_;
  $self->[2] = $child;
  $child->[3] = $self;
  return $self;
}

## Define walk method....
sub walk {
  my $self = shift;
  $self->walk_pre( @_ );
  return;
}

##
## Pre-order walk process node then the left and right sub-trees
##

sub walk_pre {
  my( $self, $fn, $global, $local, $dir ) = @_;
  $local = $fn->( $self, $global, $local, $dir||'' );
  $self->left->walk_pre(  $fn, $global, $local, 'left'  ) if $self->has_left;
  $self->right->walk_pre( $fn, $global, $local, 'right' ) if $self->has_right;
  return;
}

##
## In-order walk process left sub-tree, then the node and finally the right sub-tree
##

sub walk_in {
  my( $self, $fn, $global, $local, $dir ) = @_;
  $self->left->walk_in(  $fn, $global, $local, 'left'  ) if $self->has_left;
  $local = $fn->( $self, $global, $local, $dir||'' );
  $self->right->walk_in( $fn, $global, $local, 'right' ) if $self->has_right;
  return;
}

##
## Reverse-order walk process right sub-tree, then the node and finally the left sub-tree
##

sub walk_reverse {
  my( $self, $fn, $global, $local, $dir ) = @_;
  $self->right->walk_reverse( $fn, $global, $local, 'right' ) if $self->has_right;
  $local = $fn->( $self, $global, $local, $dir||'' );
  $self->left->walk_reverse(  $fn, $global, $local, 'left'  ) if $self->has_left;
  return;
}

##
## Post-order walk the left and right subtrees before processing the node...
##

sub walk_post {
  my( $self, $fn, $global, $local, $dir ) = @_;
  $self->left->walk_post(  $fn, $global, $local, 'left'  ) if $self->has_left;
  $self->right->walk_post( $fn, $global, $local, 'right' ) if $self->has_right;
  $local = $fn->( $self, $global, $local, $dir||'' );
  return;
}

sub flatten {
  my( $self,$dump_fn, $method ) = @_;
  $dump_fn ||= sub { $_[0] };
  $method  = $self->can( 'walk_'.($method||'pre') ) || 'walk';
  my $arrayref = [];
  $self->$method( sub {
    my($node,$global) = @_;
    push @{$global}, $dump_fn->( $node->value );
  }, $arrayref );
  return @{$arrayref};
}

sub dump {
  my( $self, $dump_fn ) = @_;
  $dump_fn ||= sub { $_[0] };
  $self->walk( sub {
    my( $node, $global, $local, $dir ) = @_;
    say join '', $local||'', $dir eq 'left' ? '<' : $dir eq 'right' ? '>' : ' ', ' ', $dump_fn->($node->value);
    return $local .= '  ';
  }, {}, '', '' );
  return;
}

1;
