#!/usr/bin/env raku

sub MAIN() {
    .say for (2019..2100).map( { Date.new( :year($_), :day(25), :month(12) ) } ).grep( *.day-of-week == 7 );
}
