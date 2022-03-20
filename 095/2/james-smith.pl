#!/usr/bin/env perl

use strict;

use warnings;
use feature qw(say);
use Test::More;


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

## Look at the Stack module for implementation

#                        return value  stack after op
my $stack = Stack->new;    # $stack    [          ]
$stack->push(2);           # $stack    [ 2        ]
$stack->push(-1);          # $stack    [ 2, -1    ]
$stack->push(0);           # $stack    [ 2, -1, 0 ]
$stack->pop;               # 0         [ 2, -1    ]
is( $stack->top, -1 );     # -1        [ 2, -1    ]
$stack->push(0);           # $stack    [ 2, -1, 0 ]
is( $stack->min, -1 );     # -1        [ 2, -1, 0 ]
$stack->pop;               # 0         [ 2, -1    ]
$stack->pop;               # -1        [ 2        ]
is( $stack->pop, 2 );      # 2         [          ]
is( $stack->top, undef );  # undef     [          ]

done_testing();

