#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems and @nums.elems %% 2 } ) {
my @nums  = (10, 7, 31, 5, 2, 2);
    my $sum = 0;
    for @nums -> $l, $r {
	$sum += $l ~ $r;
    }

    $sum.say;
#}
