#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.grep( * ~~ Int ).elems == @nums.elems } ) {
my @nums = (1,2,2,1,1,3);
    my $bag = Bag.new( @nums );

    for $bag.values -> $current {
	'0'.say and exit if ( $bag.values.grep( * ~~ $current ).elems > 1 );
    }

    '1'.say;

#}
