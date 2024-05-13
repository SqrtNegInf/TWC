#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems  && @nums.elems %% 2 }  ) {
my @nums= (2, 5, 3, 4);

    my @sorted;
    for @nums.sort.rotor( 2 ) -> @couple {
	@sorted.push: @couple.reverse.flat;
    }

    @sorted.join( " " ).say;
#}
