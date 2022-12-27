#!/usr/bin/env raku


#   my @list = [3,1,4,2]; # this input doesn't work?
    my @list = [1,4,6,4,3,5,10];
    my @found;
    my $last = 0;

    for @list.rotor( 3, :partial ) -> $triplet {
	next if $triplet.elems != 3;
	@found.push: $triplet if ( $triplet[ 0 ] < $triplet[ 1 ] < $triplet[ 2 ] );
    }

    @found.join( "\n" ).say;
