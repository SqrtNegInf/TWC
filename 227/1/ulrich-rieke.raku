#!/usr/bin/env raku
my $year = 2023;
my $sum = 0 ;
for (1..12) -> $month {
   my $d = Date.new( $year , $month , 13 ) ;
   if ( $d.day-of-week == 5 ) {
      $sum++ ;
   }
}
say "There are $sum Friday 13th in $year!" ;
