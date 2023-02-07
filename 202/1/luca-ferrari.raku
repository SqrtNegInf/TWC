#!/usr/bin/env raku

# wrong answer?

sub MAIN( @list where { @list.grep( { $_ ~~ Int && $_ > 0 } ).elems == @list.elems } = (7,8,7,7,7) ) {
    my @odds;
    for @list {
	next if $_ %% 2;
	@odds.push: $_ and next if ( ! @odds );
	next if @odds.grep( $_ );
	next if $_ != ( @odds[ * - 1 ] + 2 );
	@odds.push: $_;
    }

    '1'.say and exit if ( @odds.elems >= 3 );
    '0'.say;
}
