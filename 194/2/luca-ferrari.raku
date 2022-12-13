#!/usr/bin/env raku

sub MAIN( Str $what where { $what ~~ / ^ <[a..z]>+ $ / } = 'xyzyyxz' ) {

    my $counter = Bag.new: $what.comb;

    "1".say and exit if ( $counter.values.max - $counter.values.min == 1
                         && $counter.keys.grep( { $counter{ $_ } == $counter.values.max } ) == 1 );

    "0".say;


}
