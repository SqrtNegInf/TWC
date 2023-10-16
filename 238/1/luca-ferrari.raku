#!/usr/bin/env raku

sub MAIN( @nums where { @nums.grep( * ~~ Int ).elems == @nums.elems } = (1, 2, 3, 4, 5) ) {
    my @running-sum;
    for 0 ..^ @nums.elems -> $index {
	@running-sum[ $index ] = [+] @nums[ 0 .. $index ];
    }

    @running-sum.join( ', ' ).say;
}
