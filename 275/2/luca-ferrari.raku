#!/usr/bin/env raku

#sub MAIN( Str $string where { $string ~~ / ^ <[a..zA..Z]> <[a..zA..Z0..9]>+ $ / } ) {
my $string = 'a1c1e1 abcdef';
    my $previous;
    my @result;

    my $index = 0;
    my %alphabet;
    %alphabet{ $_ } = $index++  for 'a' .. 'z';



    $string.comb.map( -> $current is copy {
			    if ( $current.lc ~~ / <[a..z]> / ) {
				# it is a letter
				$previous = $current;
			    }
			    else {
				# it is a number
				$current = %alphabet.pairs.grep( { $_.value == ( %alphabet{ $previous } + $current.Int ) } )[ 0 ].key;
			    }

			    @result.push: $current;
			} );


    @result.join.say;
#}
