#!/usr/bin/env raku

#sub MAIN( Int :$diff
#	  , Bool :$verbose = True
#	  , *@nums where { @nums.grep( * ~~ Int ).Array.elems == @nums.elems }
#	) {

my $diff = 3;
my  @nums = (0, 1, 4, 6, 7, 10);

    my @triplets;
    # a) i < j < k
    # b) nums[j] - nums[i] == diff
    # c) nums[k] - nums[j] == diff
    for 0 ..^ @nums.elems -> $i {
	for $i ^..^ @nums.elems -> $j {
	    for $j ^..^ @nums.elems -> $k {
		@triplets.push: [ @nums[ $k, $j, $i ] ] if ( ( @nums[ $j ] - @nums[ $i ] ) == ( @nums[ $k ] - @nums[ $j ] )
							   && ( @nums[ $k ] - @nums[ $j ] ) == $diff );
	    }
	}
    }


    @triplets.elems.say;
    @triplets.join( "\n" ).say;

#}
