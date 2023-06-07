#!/usr/bin/env perl
use v5.36;

use Struct::Dumb;
my $node_to_remove = shift // 3;
my @input = 1 .. 5; 

my ($head, $counter) = create_list([@input]);

print_list($head);
remove_from_end($head, $node_to_remove);
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

sub remove_from_end
{
     my $node = $_[0];
     my $node_num = $_[1];
     
     my @noderefs;

     while ( $node )
     {
          unshift @noderefs, $node;
          $node = $node->next;
     }

     if ( $node_num >= scalar @noderefs )
     {

          _splice_node($noderefs[$#noderefs], 1);
     }
     elsif ( $node_num > 0 )
     {
          _splice_node($noderefs[$node_num]);
     }
     else
     {

          print "Position cannot be processed!$/";
     }
}






sub _splice_node
{
     my $node       = $_[0];
     my $first_node = $_[1] || 0;
     my $node_to_splice = $node->next;
     $node->val = $node_to_splice->val if $first_node;
     $node->next = $node_to_splice->next;
     $node_to_splice = undef;

}


sub print_list
{
     my $node = $_[0];

     while ( $node->next )
     {

          print $node->val, '->';
          $node = $node->next;
     }
     print $node->val, $/; # last node.
}





=output

perl ... \071\ch-2.pl 0
1->2->3->4->5
Position cannot be processed!
1->2->3->4->5

perl ... \071\ch-2.pl 1
1->2->3->4->5
1->2->3->4

perl ... \071\ch-2.pl 2
1->2->3->4->5
1->2->3->5

perl ... \071\ch-2.pl 3
1->2->3->4->5
1->2->4->5

perl ... \071\ch-2.pl 4
1->2->3->4->5
1->3->4->5

perl ... \071\ch-2.pl 5
1->2->3->4->5
2->3->4->5

perl ... \071\ch-2.pl 6
1->2->3->4->5
2->3->4->5

=cut
