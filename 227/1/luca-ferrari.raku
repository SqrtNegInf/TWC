#!/usr/bin/env raku

sub MAIN( Int $year where { 1753 <= $year <= 9999 } = 2023, Bool :$verbose = True ) {
    my @fridays;
    for 1 .. 12 -> $month {
	my $day = Date.new( year => $year, day => 13, month => $month );
	@fridays.push: $day if ( $day.day-of-week == 5 );
    }

    @fridays.elems.say;
    @fridays.join( ', ' ).say if $verbose;
}
