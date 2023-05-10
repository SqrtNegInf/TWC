#!/usr/bin/env perl
use v5.36;

my $line = 9;
while ( $line < 1 || $line > 9 ) {
  say "number must be one from the range 1 .. 9! Re-enter!" ;
  $line = <STDIN> ;
  chomp $line ;
}
my %numbers = ( "1" => "one" , "2" => "two" , "3" => "three" ,
      "4" => "four" , "5" => "five" , "6" => "six" , "7" => "seven" ,
      "8" => "eight" , "9" => "nine" ) ;
my $numword = $numbers{ $line } ;
if ( $numword eq "four" ) {
  say "four is magic." ;
}
else {
  do {
      print "$numword is " ;
      $numword = $numbers{ length $numword } ;
      print "$numword, " ;
  } until ( $numword eq "four" ) ;
  say "four is magic." ;
}
