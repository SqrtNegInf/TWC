#!/usr/bin/env perl
use v5.36;

use Struct::Dumb;

my @input = 'a' .. 'i'; 

my ($head, $counter) = create_list([@input]);

print_list($head);

transform_list($head, $counter);

print_list($head);


sub create_list
{
     my $start = undef;
     struct Node => [qw( val next )] , named_constructor => 1;
     my $end = \$start;
     my $input = $_[0];
     my $count = 0;


     for my $val ( @$input )
     {
          my $node = Node( val => $val , next => undef );
          $$end = $node;
          $end = \$node->next;
          $count++;
     } 
     return ($start, $count);

}


sub transform_list
{
     my $start = $_[0];
     my $count = $_[1];
     my $i = 0;
     
     my $next_node = $head;

     my $middle = int(($counter-1)/2);
     while ( $i < $middle )
     {
          my $last_node = _pop_last_node($next_node);
          _insert_node($next_node, $last_node);
          $next_node = $next_node->next->next;

          $i++;
     }
}


sub print_list
{
     my $node = $_[0];

     while ( $node->next )
     {
          print $node->val, ' ';
          $node = $node->next;
     }

     print $node->val, $/; # last node.
}


sub _pop_last_node 
{
     my $node = $_[0];
     my $previous = undef;
     while ($node->next) 
     { 
          $previous = $node; 
          $node = $node->next; 

     }
     $previous->next = undef;
     return $node;
}

sub _insert_node
{
     my ($previous, $new) = @_;

     my $next_old = $previous->next;
     $previous->next = $new;
     $new->next = $next_old;
}
