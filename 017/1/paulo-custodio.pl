#!/usr/bin/env perl

use Modern::Perl;

use Memoize;
memoize 'A';

sub A {
    no warnings 'recursion';
    my($m, $n) = @_;

    return $n+1                 if $m==0;
    return A($m-1, 1)           if $m>0 && $n==0;
    return A($m-1, A($m, $n-1)) if $m>0 && $n>0;
    die "invalid arguments A($m,$n)";
}

say A(0,0);
say A(1,0);
say A(1,1);
say A(1,2);
