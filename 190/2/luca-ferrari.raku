#!/usr/bin/env raku

# only one result?

sub MAIN( Str $number where { $number ~~ / ^ \d+ $ / } = '1115') {
    my %decode-table = ( 0 .. 9 ).map: { ( $_ + 1 ) => ( 'A' .. 'Z' )[ $_ ]  };
    my @decoded;
    for $number.comb -> $current {
	@decoded.push: %decode-table{ $current };
    }

    @decoded.join( '' ).say;
}
