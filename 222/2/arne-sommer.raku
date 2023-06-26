#!/usr/bin/env raku

#unit sub MAIN (*@ints where @ints.elems > 0 && all(@ints) ~~ Int && all(@ints) > 0, :v(:$verbose));
my @ints = (2, 7, 4, 1, 8, 1);

@ints = @ints>>.Int.sort.reverse; 

while @ints.elems > 1
{
  
  my $y    = @ints.shift;
  my $x    = @ints.shift;
  my $diff = $y - $x;


  if $diff
  {
    @ints.push: $diff;
    @ints = @ints.sort.reverse; 
  }
}

say @ints.elems ?? @ints[0] !! 0;
