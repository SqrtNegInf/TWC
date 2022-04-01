#!/usr/bin/env raku

use Test;

plan 2;

is(psum(9),2,"example1");
is(psum(51),3,"example2");

sub psum($n) {
  my @p=reverse grep {is-prime($_)}, (2..$n);
  my @s=grep {sum(@($_))==$n}, @p.combinations(1..@p.elems);
  return @s[0].elems;
}
