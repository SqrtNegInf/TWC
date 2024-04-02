#!/usr/bin/env raku

#sub MAIN( Int $k where { $k != 0 },
#	  *@nums where { @nums.grep( * ~~ Int ).elems == @nums.elems } ) {
my $k = 2;
my @nums = (3,1,2,2,2,1,3);

    my @pairs;

    for 0 ..^ @nums.elems -> $i {
	for $i ^..^ @nums.elems -> $j {
	    next if ( $i * $j ) !%% $k;
	    next if @nums[ $i ] != @nums[ $j ];
	    @pairs.push: [ $i, $j ];
	}
    }

    @pairs.elems.say;
#}
