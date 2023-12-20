#!/usr/bin/env raku

#sub MAIN( Str $string where { $string ~~ / ^ <[a .. z ]>+ $ / } ) {
my $string = "abcdbca";

    my @letters = $string.comb;
    my %score;
    for 0 ..^ @letters.elems - 1 {
	my $needle = @letters[ $_ ] ~ @letters[ $_ + 1 ];
	$string ~~ m:g/ $needle /;
	%score{ $/.elems }.push: $needle;
    }

    ( %score{ ( %score.keys.sort )[ * - 1 ] }.sort )[ 0 ].say;
#}
