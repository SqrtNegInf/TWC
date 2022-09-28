#!/usr/bin/env raku

sub MAIN( Str $begin-date where { / \d ** 4 '-' \d ** 2 '-' \d ** 2 / } = '2019-02-10',
          Str $end-date where { / \d ** 4 '-' \d ** 2 '-' \d ** 2 /   } = '2022-11-01' ) {

    my @dates = Date.new( $begin-date )
                , Date.new( $end-date );

    my $days = abs( @dates[ 0 ].daycount - @dates[ 1 ].daycount );
    my $years = $days >= 365 ?? ($days / 365).Int !! 0;
    $days = $days >= 365 ?? $days % 365 !! $days;

    "$begin-date - $end-date = $years years and $days days".say;
}
