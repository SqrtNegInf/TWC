#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( { $_ ~~ Int && $_ > 0 } ).elems } ) {
my @nums = 1, 2, 3, 4, 5;
    my @couples;
    for 0 ..^ @nums.elems -> $i {
	for $i ^..^ @nums.elems -> $j {
	    @couples.push: [ @nums[ $i ], @nums[ $j ] ] if ( ( @nums[ $i ] +| @nums[ $j ] ) %% 2 );
	}
    }

    @couples.join( "\n" ).say;
#}
