#!/usr/bin/env perl
use v5.36;

say missing( (5, 2, -2, 0) );


sub missing {
    my @N = sort grep {$_ > 0} @_;  # filter only positive numbers and sort
    for (0 .. $#N) {                # find missing sequence
        return $_+1 if $N[$_] != $_+1;
    }
    return scalar(@N)+1;
}
