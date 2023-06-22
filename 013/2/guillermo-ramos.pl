#!/usr/bin/env perl
use v5.36;

use Memoize qw<memoize>;

# Cache the results of previous computations
memoize('M');
memoize('F');

sub M {
    my $n = shift;
    return $n == 0
        ? 0
        : $n - F(M($n-1));
}

sub F {
    my $n = shift;
    return $n == 0
        ? 1
        : $n - M(F($n-1));
}


print "M\tF\n-\t-\n";
foreach my $n (0 .. 19) {
    printf "%d\t%d\n", M($n), F($n);
}
