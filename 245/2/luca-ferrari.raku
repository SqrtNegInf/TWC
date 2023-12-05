#!/usr/bin/env raku

# DH result??

sub MAIN( @nums where { @nums.elems == @nums.grep( * ~~ Int ).elems
					 && @nums.grep( 0 <= * <= 9 ).elems } = (8,6,7,1,0) ) {

    my $largest = -1;
    for @nums.permutations {
	my $value = $_.join.Int;
	next if $value !%% 3;
	$largest = $value if ( $value > $largest );
    }

    $largest.say;
}
