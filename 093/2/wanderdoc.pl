#!/usr/bin/env perl
use v5.36;

use Struct::Dumb;
use List::Util qw(sum);
use Test::More;

struct Node => [qw( val left right )] , named_constructor => 1;

my @paths; # Did not succeed to put it into deeper scope. :-(

# Example 1.
{
     my $root = create_root(1);
     my $n2 = add_left($root, 2);


     my $n3 = add_left($n2, 3);
     my $n4 = add_right($n2, 4); 
     is(sum_paths($root), 13, 'Example 1');
}



@paths = ();

# Example 2.
{
     my $root = create_root(1);
     my $n2 = add_left($root, 2);
     my $n3 = add_right($root, 3);
     my $n4 = add_left($n2, 4);
     my $n5 = add_left($n3, 5);
     my $n6 = add_right($n3, 6);

     is(sum_paths($root), 26, 'Example 2');
}
done_testing();

sub create_root
{
     my $val = $_[0];
     my $root = Node( val => $val , left => undef, right => undef );

     return $root;
}

sub add_left
{
     my ($parent, $val) = @_;
     my $node = Node( val => $val , left => undef, right => undef );
     $parent->left = $node;

     return $node;
}

sub add_right
{
     my ($parent, $val) = @_;
     my $node = Node( val => $val , left => undef, right => undef );
     $parent->right = $node;

     return $node;
}


sub sum_paths
{
     my $node = $_[0];
     _collect_paths($node);

     my $sum = sum(map { sum(@$_) } @paths);
     print join(' ', "\tDEBUG: " , join('->', @$_)), $/ for @paths;
     return $sum;

}

sub _collect_paths
{
     my $node = $_[0];

     my $subpath = $_[1] ? [@{$_[1]}] : [];


     if ( $node->val )
     {
          push @$subpath, $node->val;
     }


     if ( $node->left )
     {
          _collect_paths($node->left, $subpath);
     }
     if ( $node->right )
     {
          _collect_paths($node->right, $subpath);
     }
     if ((! defined $node->left) and (! defined $node->right))
     {
          push @paths, $subpath;
     }
}
