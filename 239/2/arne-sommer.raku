#!/usr/bin/env raku

unit sub MAIN ($allowed = 'ab', @str = <ad bd aaab baa badab>);

my @allow-canonical = $allowed.comb;

my $consistent = 0;

for @str -> $str
{
  $consistent++ if $str.comb.unique (<=) @allow-canonical;
}

say $consistent;
