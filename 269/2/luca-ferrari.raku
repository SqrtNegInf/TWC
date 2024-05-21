#!/usr/bin/env raku

#sub MAIN( *@nums
#	  where { @nums.elems == @nums.grep( { $_ ~~ Int && $_ > 0 } ).elems
#				  && @nums.elems > 2 } ) {
my @nums = [5, 4, 3, 8];

    my @array1;
    my @array2;

    @array1.push: @nums.shift;
    @array2.push: @nums.shift;

    while ( @nums ) {
	if ( @array1[ * - 1 ] > @array2[ * - 1 ] ) {
	    @array1.push: @nums.shift;
	}
	else {
	    @array2.push: @nums.shift;
	}
    }


    ( @array1, @array2 ).flat.join( ', ' ).say;

#}
