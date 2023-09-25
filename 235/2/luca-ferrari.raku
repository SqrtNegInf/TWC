#!/usr/bin/env raku

sub MAIN( @nums where { @nums.grep( * ~~ Int ).elems == @nums.elems } = (1, 0, 2, 3, 0, 4, 5, 0) ) {

    my @result;
    for 0 ..^ @nums.elems {
	# add the leading zero
	@result.push: 0  if @nums[ $_ ] == 0;
	# add the number, even if it is a zero, duplicated
	# from the row above
	@result.push: @nums[ $_ ];
    }

    @result[ 0 ..^ @nums.elems ].join( ',' ).say;
}
