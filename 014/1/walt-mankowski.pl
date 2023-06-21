#!/usr/bin/env perl
use v5.36;

my $N = shift @ARGV || 19;
my @vals;
my $next = 0;

for my $n (0..$N) {
    push @vals, $next;

    # have we seen it before?
    $next = 0;
    for (my $i = $n-1; $i >= 0; $i--) {
        if ($vals[$i] == $vals[$n]) {
            $next = $n - $i;
            last;
        }
    }
}

say join ", ", @vals;
