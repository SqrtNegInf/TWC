#!/usr/bin/env raku

# differrent answer?

#sub MAIN( Str $string where { $string ~~ / ^ <[a..zA..Z]>+ $ / } ) {
my $string = 'PeRlwEeKLy';
    my @letters;

    for $string.comb.grep( * ~~ / <[A..Z]> / ) -> $letter {
	next if ! $string ~~ / $letter.lc /;
	@letters.push: $letter;
    }

    @letters.sort[ * - 1 ].say if ( @letters );
#}
