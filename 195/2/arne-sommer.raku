#!/usr/bin/env raku

my @list = (1,1,2,2,6,6);
my @even = @list.grep: * %% 2;

if @even.elems
{
  my $bag    = @even.Bag;
  my $max    = $bag.values.max;
  my $res    = $bag.grep({ $_.value == $max });
  my @sorted = $res>>.key.sort;

  say @sorted.first;
}
else
{
  say -1;
}
