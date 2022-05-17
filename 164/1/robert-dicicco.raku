#!/usr/bin/env raku

for (1..1000) -> $n {
  if ((is-prime($n)) && (is-prime($n.flip)) && ($n == $n.flip)) {
    print "$n ";
  }
}

say " ";
