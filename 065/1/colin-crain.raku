#!/usr/bin/env raku

sub MAIN (Int:D $digits = 2, Int:D $total = 10 ) {

    my @result_set = grep { ($_.comb.sum) == $total }, (10**($digits-1)..10**$digits-1);

    given @result_set {
        when .list.elems > 0                { .say for @result_set }
        when $digits == 1 and $total == 0   { say 0 }
        say "no numbers of length $digits sum to $total";  ## default
    }
}
