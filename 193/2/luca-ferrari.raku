#!/usr/bin/env raku

sub MAIN( @s = <aaa bob ccc ddd> ) {
    my %translations = ( 'a' .. 'z' ).map( { state $counter = 0; $_ => $counter++ } );

    my %strings = @s.map( { $_ => $_.lc.comb.map( { %translations{ $_ }  } ) } );

    for %strings.kv -> $current-string, $current-array {
	my @difference;
	for 1 ..^ $current-array.elems {
	    @difference.push: $current-array[ $_ ] - $current-array[ $_ - 1 ];
	}

	$current-string.say if @difference.grep( { $_ !%% 2 } ).elems == @difference.elems;
    }

}
