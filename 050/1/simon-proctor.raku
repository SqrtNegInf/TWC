#!/usr/bin/env raku

subset IntPair of Str where m!^ \d+ "," \d+ $!;

multi sub MAIN ( IntPair $pair ) is hidden-from-USAGE {
    MAIN( [$pair,] );
}

#| Given a list of Integer Pairs print the sorted list of pairs with intersections combined
multi sub MAIN (
    @pairs = <2,7 3,9 10,12 15,19 18,22>
) {
    my @working = @pairs.map(*.split(",")).sort( *[0] <=> *[0] );
    my @out;
    my $current = @working.shift;

    while ( @working ) {
        my $next = @working.shift;
        if ( $current[0] <= $next[1] && $current[1] >= $next[0] ) {
            $current = [ $current[0] < $next[0] ?? $current[0] !! $next[0],
                         $current[1] > $next[1] ?? $current[1] !! $next[1]  ]; 
        } else {
            @out.push( $current );
            $current = $next;
        }
    }
    @out.push( $current ).map( *.join(",") ).join(" ").say;
}
