#!/usr/bin/env perl
use strict;
use warnings;
##
# Write a script to demonstrate Stack operations.
##

package Stack{
    use boolean;
    use Class::Struct;

    struct(
        data => q/@/
    );

    sub push{
        my($self, $n) = @_;
        push @{$self->data()}, $n;
    }

    sub pop{
        my($self, $n) = @_;
        pop @{$self->data()};
    }

    sub top{
        my($self, $n) = @_;
        @{$self->data()}[@{$self->data()} - 1];
    }
    
    sub min{
        my($self, $n) = @_;
        my @sorted = sort {$a <=> $b} @{$self->data()};
        return $sorted[0];
    }
    true;
}   

my $stack = new Stack();
$stack->push(2);
$stack->push(-1);
$stack->push(0);
$stack->pop;       
print $stack->top . "\n"; 
$stack->push(0);
print $stack->min . "\n"; 
