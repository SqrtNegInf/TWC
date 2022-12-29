#!/usr/bin/env raku

sub MAIN( @list where { @list.grep( * ~~ Int ).elems == @list.elems } = <1 2 3 6 7 9> ) {
    my @ranges;
    my $start = -1;
    my $end   = -1;
    for 0 .. @list.elems {
	    next if ! $_;
	    next if $_ <= $end;
	    $end = $start = $_;
	    $end++ while ( $end < @list.elems &&  @list[ $end + 1 ] == @list[ $end ] + 1 );
    	@ranges.push: [ $start, $end ] if ( $start < $end );
    }

    @ranges.join( "\n" ).say;
}
