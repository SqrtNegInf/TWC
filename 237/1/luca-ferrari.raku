#!/usr/bin/env raku

sub foo( $y, $m, $d, $w ) {
    my $date = Date.new( year => $y,
			 month => $m,
			 day => 1 );

    my %ord = 1 => 'first', 2 => 'second', 3 => 'third';
    %ord{ $_ } = $_ ~ 'th' for ( 4 .. 31 );

    my %names = 1 => 'Monday',
		2 => 'Tuesday',
		3 => 'Wednsday',
		4 => 'Thursday',
		5 => 'Friday',
		6 => 'Saturday',
		7 => 'Sunday';

    my $current-week = 0;
    while ( $date.month == $m && $date.year == $y ) {

	$current-week++ if ( $date.day-of-week == 1 );
	if ( $date.day-of-week == $d && $current-week == $w ) {
	    "The { %ord{ $current-week } } { %names{ $date.day-of-week } } of month $m in year $y is { $date.day }".say;
	    exit;
	}
	$date++;
    }

    'Not found'.say;
}

foo(2024,4,3,2);
