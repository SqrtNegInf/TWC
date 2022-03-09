#!/usr/bin/env raku

unit sub MAIN (Int $N where $N >= 10 = 35, :v(:$verbose));

if True
{
  say ": Digits: {  $N.comb }";
  say ": Squares: { $N.comb.map( * ** 2) }";
  say ": Sum: {     $N.comb.map( * ** 2).sum }";
  say ": Root: {    $N.comb.map( * ** 2).sum.sqrt }";
}

say +($N.comb.map( * ** 2).sum.sqrt.narrow ~~ Int); # had to add '.narrow' for this to work
