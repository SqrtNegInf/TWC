#!/usr/bin/env perl
use v5.36;

no warnings 'recursion';
#Deep recursion on subroutine "%s"
#(W recursion) This subroutine has called itself (directly or indirectly) 100 times more than it has returned.
#This probably indicates an infinite recursion, unless you're writing strange benchmark programs, in which case it indicates something else.

use Memoize;
memoize('a');

sub a {
    my ($m, $n) = @_;
    return $n+1 if ($m == 0);
    return a($m-1,1) if ($n == 0);
    return a($m-1,a($m,$n-1));
}

say a(0,0);
say a(1,0);
say a(1,1);
say a(1,2);
