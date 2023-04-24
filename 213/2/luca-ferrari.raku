#!/usr/bin/env raku


sub MAIN( Int $source = 1, Int $destination = 7, $r = '1 2 6 | 5 6 7' ) {
    my @routes;
    my @current;
    for $r.comb( :skip-empty ) {
	next if ! $_;

	if $_ ~~ "|" {
	    @routes.push: [@current];
	    @current = ();
	    next;
	}

	@current.push: $_.Int if ( $_.Int > 0 );

    }

    @routes.push: [@current] if ( @current );

    my ( $source-index, $destination-index );
    for 0 ..^ @routes.elems -> $index {
	$source-index = $index and next if ( @routes[ $index ].grep( $source ) );
	$destination-index = $index and next if ( @routes[ $index ].grep( $destination ) );
    }


    my @current-path;
    my $next-route = $source-index;
    my $loop = True;
    while ( $loop ) {
	for @routes[ $next-route ].Array -> $node {
	    @current-path.push: $node if ( ! @current-path.grep( * ~~ $node ) );

	    $loop = False;
	    for $next-route ^..^ @routes.elems -> $jump-to {

		if ( @routes[ $jump-to ].grep( { $_ ~~ $node } ) ) {
		    $next-route = $jump-to;
		    $loop = True;
		    last;
		}
	    }

	    last if $loop;
	}
    }

    @current-path.join( ' -> ' ).say;
}
