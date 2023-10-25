#!/usr/bin/env raku

my @dateparts = (2024,4,3,2);
#construct a date for the first day in the given month of the given year
my $d = Date.new( @dateparts[ 0 ] , @dateparts[ 1 ] , 1 ) ;
#add a day until you reach the given weekday
while ( $d.day-of-week != @dateparts[ 3 ] ) {
   $d .= later( days => 1 ) ;
}
#if we want the day of the first given weekday we're already there
if ( @dateparts[ 2 ] == 1 ) {
   say $d.day ;
}
#otherwise, we add as many days as necessary to reach the n'th given weekday
else {
   $d .= later( days => ( @dateparts[ 2 ] - 1 ) × 7 ) ;
   if ( $d.month != @dateparts[ 1 ] ) {#a month rollover occurred! we must output 0!
      say 0 ;
   }
   else {
      say $d.day ; #otherwise, we output the day
   }
}
