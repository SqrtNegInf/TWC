#!/usr/bin/env raku

unit sub MAIN (Int $N = 101);

my $binary  = $N.fmt('%08b');
my $swapped = $binary.comb(2)>>.flip.join;

if True
{
  say ": Binary:  $binary";
  say ": Swapped: $swapped (binary)";
}

say $swapped.parse-base(2);
