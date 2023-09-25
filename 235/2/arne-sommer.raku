#!/usr/bin/env raku

unit sub MAIN (@ints where all(@ints) ~~ Int = (1, 0, 2, 3, 0, 4, 5, 0) );

my $seq := gather
{
  for @ints -> $int
  {
    take $int;
    take $int if $int == 0;
  }
}

say "({ $seq[^@ints.elems].join(", ") })";
