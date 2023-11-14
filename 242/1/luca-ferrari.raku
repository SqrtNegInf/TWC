#!/usr/bin/env raku

#sub MAIN( Str $left, Str $right ) {

    my @left=(1, 2, 3, 3);
    my @right=(1, 1, 2, 2);

    #my @left = $left.split( ',' ).map( *.Int );
    #my @right = $right.split( ',' ).map( *.Int );

    my ( @missing-left, @missing-right );

    @missing-left.push: $_ if ( ! @left.grep( $_ ) )  for @right;
    @missing-right.push: $_ if ( ! @right.grep( $_ ) )  for @left;

    ( @missing-left, @missing-right ).say;
#}
