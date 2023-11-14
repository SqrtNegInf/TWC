#!/usr/bin/env raku

sub MAIN() {

    my @matrix =  [ 1, 1, 0 ],
		  [ 0, 1, 1 ],
		  [ 0, 0, 1 ],
    ;

    my @output;
    for @matrix -> $row {
	my $new-row = $row.join.flip.comb.map( { $_ == 0 ?? 1 !! 0 } );
	@output.push: [ $new-row ];
    }

    @output.join( "\n" ).say;
}
