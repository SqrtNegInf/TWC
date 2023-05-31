#!/usr/bin/env perl
use v5.36;

package Node;
use Moo;

    has value => ( is => 'rw' );
    has down  => ( is => 'rw' );

package Stack;
use Moo;

    has last => ( is => 'rw' );

    sub push {
        my ($self, $value) = @_;
        my $node = Node->new( value => $value ,
                              down  => $self->last  );
        $self->last( $node );
    };

    sub pop {
        my $self = shift;
        my $node = $self->last;
        $self->last( $node->down );
        return $node->value;
    }

    sub top {
        my $self = shift;
       return $self->last->value;
    }

    sub min {
        my $self = shift;
        my $node = $self->last;
        my $min  = $node->value;
        while ( defined $node->down ) {
            $min = $node->down->value if $node->down->value < $min;
            $node = $node->down;
        }
        return $min;
    }

package main;

my $stack = Stack->new;
$stack->push( 2 );
$stack->push( -1 );
$stack->push( 0 );
$stack->pop;                # removes 0
say $stack->top;            # prints -1
$stack->push( 0 );
say $stack->min;            # prints -1







