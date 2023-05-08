#!/usr/bin/env raku

#sub MAIN( :$count is copy where { $count >= 0 } ,
#		*@digits is copy where { @digits.grep( 0 <= *.Int <= 1  ).elems == @digits.elems }  ) {
my $count =1;
my @digits = <1 0 0 0 1>;

    my $done = False;
    while $count {
	$done = False;
	for 1 ..^ @digits.elems - 1 {
	    if ( @digits[ $_ ] == 0 && @digits[ $_ - 1 ] == 0 && @digits[ $_ + 1 ] == 0 ) {
		@digits[ $_ ] = 1;
		$count--;
		$done = True;
		last;
	    }
	}

	'0'.say and exit if ! $done;
    }

    '1'.say and exit if ! $count;
    '0'.say;
#}
