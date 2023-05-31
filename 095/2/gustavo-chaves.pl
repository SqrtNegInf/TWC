#!/usr/bin/env perl
use v5.36;

use List::Util;

package Stack {

    sub new {
        my $class = shift;

        return bless [], $class;
    }

    sub push {
        my ($self, $n) = @_;

        push @$self, $n;
        return;
    }

    sub pop {
        my ($self) = @_;

        return pop @$self;
    }

    sub top {
        my ($self) = @_;

        return $self->[-1];
    }

    sub min {
        my ($self) = @_;

        return List::Util::min @$self;
    }

};


my $stack = Stack->new;
$stack->push(2);
$stack->push(-1);
$stack->push(0);
$stack->pop;       # removes 0
say $stack->top; # prints -1
$stack->push(0);
say $stack->min; # prints -1
