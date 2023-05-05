#!/usr/bin/env perl
use v5.36;
use DateTime ;

my $year = 2022 ;
my @lastDays = ( 31 , 28 , 31 , 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31) ;
my $dt1 = DateTime->new( year => $year , month => 12 , day => 10 ) ;
if ( $dt1->is_leap_year ) {
  $lastDays[1] = 29 ;
}
my @lastSundays ;
for my $month( 1 .. 12 ) {
  my $dt = DateTime->new( year => $year , month => $month , day =>
    $lastDays[ $month - 1 ] ) ;
  while ( $dt->day_of_week != 7 ) {
      $dt->subtract( days => 1 ) ;
  }
  push @lastSundays , $dt ;
}
map { say $_->ymd} @lastSundays ;
