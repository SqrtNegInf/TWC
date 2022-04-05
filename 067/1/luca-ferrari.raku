#!/usr/bin/env raku


sub MAIN( Int :$m where { 10 > $m > 2 }  = 5,
          Int :$n where { $n < $m } = 3 ) {

    # found combinations
    my @combinations;


    for ( 1 x $n ).Int ^..^ ( $m x $n  ).Int {
        my @digits = $_.comb;
        next if @digits.elems != $n;
        next if @digits.grep( * > $m );
        next if @digits.sort !~~ @digits;
        next if @digits.unique !~~ @digits;

        @combinations.push: @digits;
    }


    @combinations.sort.join( ", " ).say;
}
