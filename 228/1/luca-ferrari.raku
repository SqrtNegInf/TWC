#!/usr/bin/env raku

sub MAIN( @nums  where { @nums.elems == @nums.grep( * ~~ Int ).elems } = (2, 1, 3, 2) ) {
    my $bag = @nums.Bag;
    $bag.keys.grep( { $bag{ $_ } == 1 } ).sum.say;
}
