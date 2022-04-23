#!/usr/bin/env raku

my $line = 5;
while ( +$line < 1 || +$line > 9 ) {
  say "Number should be between 1 and 9! Re-enter!" ;
  $line = $*IN.get ;
}
my %numbers = ( "1" => "one" , "2" => "two" , "3" => "three" ,
      "4" => "four" , "5" => "five" , "6" => "six" , "7" => "seven" ,
      "8" => "eight" , "9" => "nine" ) ;
my $numword = %numbers{ $line } ;
if ( $numword eq "four" ) {
  say "four is magic." ;
}
else {
  repeat {
      print "$numword is " ;
      $numword = %numbers{ $numword.chars } ;
      print "$numword, " ;
  } until ( $numword eq "four" ) ;
  say "four is magic." ;
}
