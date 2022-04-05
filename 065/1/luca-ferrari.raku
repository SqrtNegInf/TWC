#!/usr/bin/env raku

sub MAIN( Int $N where { $N > 0 } = 2,
          Int $S where { $S >= 1 && $S <= 90 } = 10 ) {

    my @found;
    "Searching numbers with $N digits that sum to $S between { 1 ~ ( 0 x $N - 1 ) } and { $S ~ ( 0 x $N - 1 ) }".say;
    for ( 1 ~ ( 0 x $N - 1 ) ).Int .. ( $S ~ ( 0 x $N - 1 ) ).Int {
        @found.push: $_ if ( [+] $_.split( '', :skip-empty ) ) == $S ;
    }

    @found.say;

}
