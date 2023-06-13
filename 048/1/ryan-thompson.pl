#!/usr/bin/env perl
use v5.36;

say survivor(50); 

# Linked list solution
sub survivor {
    my $N = shift;
    my @ll = (undef, 2..$N, 1); # Circular linked list
    my $cur = 1;
    $ll[$cur] = $ll[$ll[$cur]], $cur = $ll[$cur] until $ll[$cur] == $cur;

    $cur;
}

sub analytic {
    my $N = shift;
    2 * ($N - 2**int( log($N) / log(2) )) + 1;
}

use Test::More;

is survivor(100), 73;
is survivor(50), 37;
is survivor($_), analytic($_) for 1..100;
done_testing;
