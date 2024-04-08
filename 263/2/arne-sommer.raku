#!/usr/bin/env raku

#unit sub MAIN ($items1, $items2, :v(:$verbose));

my @items1 = [[1, 1], [2, 1], [3, 2]];
my @items2 = [[2, 2], [1, 3]];

my %count;

for @items1 -> $item
{
  say ": item1 ID $item[0] with frequency $item[1]";
  %count{$item[0]} += $item[1];
}

for @items2 -> $item
{
  say ": item2 ID $item[0] with frequency $item[1]";
  %count{$item[0]} += $item[1];
}

my @output;

for sort keys %count -> $key
{
  @output.push: ($key.Int, %count{$key});
}

say @output.raku;
