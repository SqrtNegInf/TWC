#!/usr/bin/env raku

subset PosInt of Int where * > 0;

sub MAIN(PosInt $n = 100) {
  2 ..^ $n ==> map &is-prime ==> sum() ==> say();
}
