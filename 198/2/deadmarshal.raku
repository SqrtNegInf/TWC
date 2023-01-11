#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle Native module' if $*VM ~~ /jvm/;

use Math::Primesieve;

my $p = Math::Primesieve.new;

for [10,15,1,25] {
  say $p.primes($_).elems;
}

