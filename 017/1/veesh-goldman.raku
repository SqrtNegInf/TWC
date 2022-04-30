#!/usr/bin/env raku

# and with this, we can calulate A(4,2) in .5 seconds. Not bad!

sub arrow ( Int $base, Int $times, Int $arrows ) {
  return $base ** $times if $arrows == 1;
  ($base xx $times).reduce: -> $x, $y { arrow($y, $x, $arrows - 1) }
}

sub A ( $m, $n ) {
  return $n + 1     if $m == 0;
  return $n + 2     if $m == 1;
  return 2 * $n + 3 if $m == 2;
  arrow( 2, $n + 3, $m - 2 ) - 3
}

multi sub MAIN ( Int $m =1, Int $n =2 ) {
  say A($m, $n)
}

#multi sub MAIN {
#  say arrow(2,3,2);
#}

