#!/usr/bin/env raku

#sub MAIN( Int $m is copy , Int $n is copy ) {
my ($m,$n) = 8, 24;
  if ( log2( $m gcd $n) %% 1 ) {
      say 1 ;
  }
  else {
      say 0 ;
  }
#}
