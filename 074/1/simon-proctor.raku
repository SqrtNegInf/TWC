#!/usr/bin/env raku
#| Given a list of integers return the majority nummber of -1 if there isn't one
sub MAIN ( @numbers = (1, 2, 2, 3, 2, 4, 2)) {
    my $mid = floor( @numbers.elems / 2 );
    say @numbers.Bag.kv.grep( -> $v, $c { $c > $mid })[0][0] // -1;
}
