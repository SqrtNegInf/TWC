#!/usr/bin/env raku

sub MAIN( @list where{ @list.elems == @list.grep( * ~~ Int ).elems } = 1..8 ) {

    for @list.permutations -> @current {
	# for 0 ..^ @current.elems {
	#     # find the first couple that gives the same average
	#     my ($left, $right) = @current[ 0 .. $_ ], @current[ $_ + 1 .. * ];
	#     if ( ( $left.sum / $left.elems ) == ( $right.sum / $right.elems ) ) {
	# 	say "{ $left.join( ',' ) } = { $left.sum / $left.elems }  and { $right.join( ',' ) } = { $right.sum / $right.elems } ";
	# 	exit;
	#     }
	# }

	my $split-at = ( @current.elems - 1 ) / 2;
	my ($left, $right) = @current[ 0 .. $split-at ], @current[ $split-at + 1  .. *  ];
	if ( ( $left.sum / $left.elems ) == ( $right.sum / $right.elems ) ) {
	    say "{ $left.join( ',' ) } = { $left.sum / $left.elems }  and { $right.join( ',' ) } = { $right.sum / $right.elems } ";
	    exit;
	}

    }
}
