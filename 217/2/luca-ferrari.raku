#!/usr/bin/env raku

sub MAIN( @list where { @list.grep( * ~~ Int ).elems == @list.elems }= (31, 2, 4, 10) ) {
    my $max = 0;
    for @list.permutations {
	$max = $_.join if ( $_.join.Int > $max );
    }

    $max.say;
}
