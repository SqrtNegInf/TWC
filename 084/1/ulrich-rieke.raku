#!/usr/bin/env raku

sub MAIN (Str $N  = '-1700') {
  $N ~~ /(<[+-]>*)(\d+)/ ;
  my $maximum = 2147483647 ;
  if ( $N.Int <= $maximum ) {
      say ($0.Str ~ $1.Str.flip) ;
  }
  else {
      say 0 ;
  }
}
