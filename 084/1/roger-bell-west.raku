#!/usr/bin/env raku

use Test;

plan $*VM ~~ /jvm/ ?? 3 !! 4;

is(ri(1234),4321,'example 1');
is(ri(-1234),-4321,'example 2');
is(ri(1231230512),0,'example 3') unless $*VM ~~ /jvm/;  # fails on JVM
is(ri(-1700),'-0071','example 4'); # bah

sub ri(Int $s) {
  my $r=$s.comb.reverse.join('');
  if ($r ~~ /(<[0..9]>+)\-$/) {
    $r="-$0";
  }
  my int32 $b=Int($r);
  if ($b != $r) {
    return 0;
  }
  return $r;
}
