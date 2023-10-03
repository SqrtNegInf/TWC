#!/usr/bin/env raku

sub MAIN( @nums  where { @nums.grep( * ~~ Int ).elems == @nums.elems } = (4,6,3,8,15,0,13,18,7,16,14,19,17,5,11,1,12,2,9,10) ) {

    my @loops;
    for 0 ..^ @nums.elems -> $current-start {
	my @current-path = ();

	@current-path.push: @nums[ $current-start ];

	my $next = @nums[ $current-start ];
	while ( 0 < $next < @nums.elems ) {
	    @current-path.push: @nums[ $next ];

	    if @nums[ $next ] == $current-start {
		# loop detected
		@loops.push: @current-path;
		last;
	    }

	    $next = @nums[ $next ];
	}

    }

    @loops.elems.say;
}
