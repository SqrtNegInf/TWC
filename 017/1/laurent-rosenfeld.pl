#!/usr/bin/env perl
use v5.36;
no warnings 'recursion';

sub ack {
    my ($m, $n) = @_;
    return $n + 1 if $m == 0;
    return ack($m - 1, 1) if $n == 0;
    return ack($m - 1, ack($m, $n-1));
}
say ack 3, 4;
