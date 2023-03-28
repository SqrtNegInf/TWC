#!/usr/bin/env raku

my @bits = (1,1,1,0);

my $string = "";

while (@bits.elems)
{
  my $first = @bits.shift;

  if $first == 0
  {
    $string ~= 'a';
  }
  elsif (@bits.elems)
  {
    my $second = @bits.shift;
    $string ~= $second == 0 ?? 'b' !! 'c';
  }
  else
  {
    $string ~= "ERROR";
  }
}

say ":String: $string";

say + $string.ends-with('a');
