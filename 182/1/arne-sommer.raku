#!/usr/bin/env raku

unit sub MAIN (@n where @n.elems > 0 && all(@n) ~~ Int = (1,2,4,2,4,1));

my $max = @n.max;

for ^@n.elems -> $index
{
  if @n[$index] == $max
  {
    say $index;
    last;
  }
}
