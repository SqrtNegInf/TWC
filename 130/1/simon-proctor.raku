#!/usr/bin/env raku

#| Given a list of values 1 will appear an odd number of times. Output that value.
sub MAIN( @a = (2, 5, 4, 4, 5, 5, 2) ) {
    @a.Bag.pairs.first( -> $p { $p.value !%% 2 }).key.say;
}
