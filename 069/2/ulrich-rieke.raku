#!/usr/bin/env raku

sub mySwitch( Str $num is copy --> Str ) {
  my $switched = $num.comb.map( { $_ eq "0" ?? "1" !! "0" } ).join ;
  return $switched ;
}

my $current = "0" ;
my $n = 1 ;
while ( $n < 7 ) {
  $current = $current ~ "0" ~ mySwitch( $current.flip ) ;
  $n++ ;
}
say $current ;
