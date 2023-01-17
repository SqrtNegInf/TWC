#!/usr/bin/env raku

unit sub MAIN (Int $x = 7, Int $y = 2, Int $z = 3, @array = (3,0,1,1,9,7), :v(:$verbose));

my $triplets = 0;

for 0 .. @array.end - 2 -> $i
{
  for $i + 1 .. @array.end - 1 -> $j
  {
    for $j + 1 .. @array.end -> $k
    {
      next unless abs(@array[$i] - @array[$j]) <= $x;
      next unless abs(@array[$j] - @array[$k]) <= $y;
      next unless abs(@array[$i] - @array[$k]) <= $z;

      $triplets++;

      say ": (@array[$i, $j, $k]) where (i=$i, j=$j, k=$k)" if $verbose;
    }
  }
}

say $triplets;
