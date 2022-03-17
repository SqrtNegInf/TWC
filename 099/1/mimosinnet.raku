#!/usr/bin/env raku
# https://perlweeklychallenge.org/blog/perl-weekly-challenge-099/

#|
sub challenge( $string, $pattern is copy ) {
  $pattern = '^' ~ $pattern.trans( [ '*', '?' ] => [ '.*' , '.' ]) ~ '$' ;
  $string ~~ /<$pattern>/ ?? 1 !! 0;
}

#multi sub MAIN( $string, $pattern ) { say 'Input: $S = "',$string,'" $P = "', $pattern, '"'; say 'Output: ',challenge($string, $pattern),"\n"; }

#multi sub MAIN( 'test' ) {
  use Test;

  my @tests = (
    ( 'abcde', 'a*e',    1),
    ( 'abcde', 'a*d',    0),
    ( 'abcde', '?b*d',   0),
    ( 'abcde', 'a*c?ei', 0),
  );

  for @tests -> ($a, $b, $c) {
    is challenge($a, $b), $c;
  }
 
#}
