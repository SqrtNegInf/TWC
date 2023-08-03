#!/usr/bin/env perl
use v5.36;

use DateTime ;

my $year = 2023;
my $sum = 0 ;
for my $m (1..12) {
   my $dt = DateTime->new(
	 year => $year , 
	 month => $m , 
	 day   => 13 , 
	 hour  => 0 , 
	 minute => 0 , 
	 second => 0 , 
	 nanosecond => 0 , 
	 time_zone => 'Asia/Taipei' , 
	 ) ;
   if ( $dt->day_of_week == 5 ) {
      $sum++ ;
   }
}
say "The number of Friday 13th in $year is $sum!" ;
