#!/usr/bin/env raku

# given wrong answer

sub diff ( $start, $end ) {
    my ( $start-hours, $start-mins ) = $start.chomp.split( ':' );
    my ( $end-hours, $end-mins ) = $end.chomp.split( ':' );

    if ( $start-hours == 0 ) {
	$start-hours = 23;
	$start-mins += 60;
    }

    if ( $end-hours == 0 ) {
	$end-hours = 23;
	$end-mins += 60;
    }

    my $diff-hours = abs( $end-hours - $start-hours );
    my $diff-mins  = abs( $end-mins - $start-mins ) % 60;

    return $diff-hours * 60 + $diff-mins;

}

sub MAIN( @times = ("10:10", "09:30", "09:00", "09:55") ) {

    my %diffs;
    %diffs{ diff( $_[ 1 ], $_[ 0 ] ) } = [ $_[0], $_[1] ] for @times.sort.combinations( 2 );

    %diffs.keys.map( *.Int ).min.say;
    %diffs{ %diffs.keys.map( *.Int ).min }.join( ' - ' ).say ;#if ( $verbose );
}
