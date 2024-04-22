#!/usr/bin/env raku

sub MAIN(
    @ints  = (1,2,3,3,3,3,4,2)
) {
    @ints.classify( { $_}, :into(my %count));
    %count.keys.sort.grep({ %count{$_}.elems / @ints.elems > 0.33 }).first.say;
}
