#!/usr/bin/env raku

sub MAIN( @nums where { @nums.grep( * ~~ Int ).elems == @nums.elems } = (0, 2, 9, 4, 6) ) {

    for 0 ..^ @nums.elems {
	my @current;
	@current.push: | @nums[ 0 .. $_ - 1 ] if $_ != 0;
	@current.push: | @nums[ $_ + 1 ..^ @nums.elems ];

	'true'.say and exit if @current ~~ @current.sort;
    }

    'false'.say;
}
