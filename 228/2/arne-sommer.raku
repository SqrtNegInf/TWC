#!/usr/bin/env raku

#unit sub MAIN (*@int where @int.elems > 0 && all(@int) ~~ Int && @int.elems == @int.unique.elems);

my @int = (3, 4, 2);

my $operations = 0;

while @int.elems
{
  my $first = @int.shift;
  $operations++;

  @int.push: $first if $first > @int.min; 
}

say $operations;
