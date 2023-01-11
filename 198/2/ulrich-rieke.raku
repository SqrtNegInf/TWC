#!/usr/bin/env raku

sub MAIN( Int $number = 100) {
  say (0..^$number).grep( {.is-prime} ).elems ;
}
