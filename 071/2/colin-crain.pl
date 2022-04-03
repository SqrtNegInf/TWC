#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";
use Moo;

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## CLASSES:

package Node;
use Moo;

    has value => ( is => 'rw' );
    has next  => ( is => 'rw' );

    sub terminate {
        $_[0]->{value} = undef;
    }
    
    sub lookahead {
    ## looks forward n nodes in list 
    ## returns:  1 if node is not last node
    ##           0 if node is last node
    ##          -1 if list not long enough 
        my ($self, $distance) = @_;
        if (! defined $self->next && $distance > 0) {
            return -1;
        }
        if ($distance == 0) { 
            return $self->next ? 1 : 0;       
        }
        return lookahead($self->next, $distance - 1);
    }



package LinkedList;
use Moo;

    has 'start_node' => ( is => 'rw' );

    sub populate_from_array  {
    ## convert array into a linked list
    ## sets start_node
        my ($self, @input) = @_;
        my ($node, $next);
        while (scalar @input > 0) {
            my $value =  pop @input;
            $node = new Node(value => $value, next => $next);
            $next = $node;
        }
        $self->start_node($node);
    }

    sub arrow_print {
    ## pretty print the list
        my $self = shift;
        my $node = $self->start_node;

        my @output;
        while (defined $node) {
            push @output, $node->value;
            $node = $node->next;
    
        }
        say join ' → ', @output;
    }
    
    sub remove_next {
    ## splices out the next node and relinks
        my ($self, $node) = @_;
        my $unlinked = $node->next;
        $node->next( $node->next->next );
        $unlinked->terminate;
    }
    
    sub remove_head {
    ## remove the starting node and resets start to second node
        my $self = shift;
        my $unlink = $self->start_node;
        $self->start_node($self->start_node->next);
        $unlink->terminate;
    }


## ## ## ## ## ## ## ## ## ## ## ## ## ## ## MAIN:

package main;
use Node;
use LinkedList;

my ($n, @input) = (3, 1..6); 
say "input  @input
target $n
----------------------------------
";

my $list = new LinkedList;
$list->populate_from_array(@input);
$list->arrow_print;

## unlink the n-th node from the end
my $node = $list->start_node;
while ( -looking_ahead ) {
    my $res = $node->lookahead( $n ) ;
    if ( $res < 1 ) {
        $res ==  0 && $list->remove_next($node);
        $res == -1 && $list->remove_head;
        last;
    }
    $node = $node->next;
}

$list->arrow_print;

