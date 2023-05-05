#!/usr/bin/env perl
use v5.36;
use List::Util qw(all);
my @reversible;
for (10..100-1){
     push @reversible, $_ if is_reversible($_)
}
say join ", ", @reversible;
sub is_reversible($n){   # read the comments from the bottom up
    return all {$_%2==1} # and check they are all odd
        split "",        # split the digits of the result
            $n           # the original number
            +            # add it to
            reverse $n   # reverse digits
}
