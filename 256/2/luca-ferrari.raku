#!/usr/bin/env raku

sub MAIN( Str $left = 'abcd', Str $right = '1234' ) {
    my $output = ( $left.comb Z $right.comb ).flat.join;

    if ( $left.chars > $right.chars ) {
	$output ~= $left.comb[ $right.chars .. * ].join;
    }
    elsif ( $left.chars < $right.chars ) {
	$output ~= $right.comb[ $left.chars .. * ].join;
    }

    $output.say;
}
