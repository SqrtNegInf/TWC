#!/usr/bin/env perl
use v5.36;

sub shuffle_string{
    my($s, $indices) = @_;
    my @s = split(//, $s);
    my @t;
    do { $t[$_] = shift @s } for @{$indices};
    return join(q//, @t);
}

MAIN:{
    say shuffle_string(q/lacelengh/, [3, 2, 0, 5, 4, 8, 6, 7, 1]);
    say shuffle_string(q/rulepark/, [4, 7, 3, 1, 0, 5, 2, 6]);
}
