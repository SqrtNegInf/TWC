#!/usr/bin/env raku
# https://perlweeklychallenge.org/blog/perl-weekly-challenge-113/

#|
sub challenge( $n, $d ) {
  return (1..$n).grep( /$d/ ).combinations(1..*).map({ $_.sum }).grep($n).Bool.Int;
}

  use Test;

  is challenge(25,7),0;
  is challenge(24,7),1;

  done-testing;
