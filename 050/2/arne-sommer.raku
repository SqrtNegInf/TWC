#!/usr/bin/env raku

my @numbers = 19,11,9,7,20,3,17,16,2,14,1;

for @numbers.sort.squish -> $number
{
  if @numbers.grep(* > $number).elems == $number
  {
    say $number;
    exit;
  }
}
