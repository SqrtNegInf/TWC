#!/usr/bin/env raku

sub MAIN( Int $start is copy  = 3,
	  @nums = (5, 3, 6, 1, 12) ) {

    while ( @nums.grep( * ~~ $start ) ) {
	$start *= 2;
    }

    $start.say;
}
