#!/usr/bin/env raku

#| Display Help

#| Print the list of prime multiples of the given value 
multi sub MAIN (
    UInt $value = 11111
) {

    my $working = $value;
    my @out;
    while ! $working.is-prime {
        my $div = least-prime-divisor( $working );
        @out.push( $div );
        $working = $working div $div;
    }
    @out.push($working);
    say @out.join(",");
}

multi sub least-prime-divisor( UInt() $n where $n.is-prime ) {
    $n;
}

multi sub least-prime-divisor( UInt() $n ) {
    (2..$n).grep( *.is-prime ).first( { $n %% $_ } );
}
