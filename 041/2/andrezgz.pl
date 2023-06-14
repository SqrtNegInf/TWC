#!/usr/bin/env perl
use v5.36;

use Memoize;

memoize('fib');

my $upto = shift || 20;
print leo_from_fib($_).' ' for (0 .. --$upto);

sub leo_from_fib {
    return 2 * fib($_[0] + 1) - 1;
}

sub fib {
    my $n = shift;
    return $n <= 1 ? $n : fib($n-1) + fib($n-2);
}
