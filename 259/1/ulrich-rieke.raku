#!/usr/bin/env raku

my $date = '2018-06-28';
my $offset = 1;
my @holidays = '';
(my $year , my $month , my $day ) = $date.split( /\-/ ) ;
my $currentDate = Date.new( $year.Int , $month.Int , $day.Int ) ;
while ( $offset != 0 ) {
   $currentDate = $currentDate + 1;
   if ( $currentDate.day-of-week < 6 && ( so ~$currentDate eq @holidays.none ) ) {
      $offset-- ;
   }
}
say $currentDate ;
