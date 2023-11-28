#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {

    my @nums = (2, 0, 1, -10);

    my $power = 0;
    for @nums.combinations {
	next if ! $_;
	$power +=  $_.min * ( $_.max  ** 2 );
    }

    $power.say;
#}
