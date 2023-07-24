#!/usr/bin/env raku

#sub MAIN( *@numbers is copy where { @numbers.grep( * ~~ Int && * >= 0 ).elems == @numbers.elems } ) {
    my @numbers = (1, 5, 0, 3, 5);
    my $moves;

    while ( @numbers.grep( * == 0 ).elems != @numbers.elems ) {
	my $removing = @numbers.grep( * > 0 ).min;
	$moves++;
	for 0 ..^ @numbers.elems {
	    next if ! @numbers[ $_ ];
	    @numbers[ $_ ] -= $removing;
	}
    }

    $moves.say;
#}
