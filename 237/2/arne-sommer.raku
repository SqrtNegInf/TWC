#!/usr/bin/env raku

unit sub MAIN (@nums where all(@nums) ~~ Int && @nums.elems > 0 = (1,3,5,2,1,3,1,5,5,5,4) );

my $count  = 0;

my @sorted = @nums.sort.reverse;

for @sorted.clone -> $num
{
  if $num < @sorted[0]
  {
    $count++;
    @sorted.shift;
  }
  else
  {
    @sorted.pop;
  }
}

say $count;
