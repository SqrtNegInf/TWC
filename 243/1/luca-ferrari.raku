#!/usr/bin/env raku

#sub MAIN( Bool :$verbose = True, *@nums where { @nums.elems == @nums.grep( { $_ ~~ Int } ).elems } ) {
my @nums  = (1, 3, 2, 3, 1);

    # A reverse pair is a pair (i, j) where: a) 0 <= i < j < nums.length and b) nums[i] > 2 * nums[j].
    my @reverse_pairs;
    for 0 ..^ @nums.elems -> $i {
	@reverse_pairs.push: [ @nums[ $i ], $_ ] for  @nums[ $i + 1 .. * ].grep( { @nums[ $i ] > 2 * $_ } );
    }

    @reverse_pairs.elems.say;
    #@reverse_pairs.join( "\n" ).say if $verbose;
#}
