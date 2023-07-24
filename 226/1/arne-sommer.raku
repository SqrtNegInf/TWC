#!/usr/bin/env raku

#unit sub MAIN ($string where $string.chars > 0,
#               *@indices where @indices.elems == @indices.unique.elems == $string.chars
#	       && all(@indices) ~~ UInt && all(@indices) < $string.chars);

my $string = 'lacelengh';
my @indices = [3,2,0,5,4,8,6,7,1];
my @string = $string.comb;

my @out;

for ^@string.elems -> $i
{
  @out[@indices[$i]] = @string[$i]
}

say @out.join;
