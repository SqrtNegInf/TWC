#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems && @nums.elems >= 1 } ) {
    my $sum = 0;
    my @nums = (2, 5, 9);

    for @nums -> $current {
	$sum += [+] ( @nums.map( { ( $current / $_ ).Int }  ) );
    }

    $sum.say;
#}
