#!/usr/bin/env raku

my @array = <1 2 3 6 7 9>;

my @ranges;
my $from = @array.shift.Int;
my $to   = $from;

while @array
{
  my $next = @array.shift.Int;
  if $next == $to + 1
  {
    $to = $next;
  }
  else
  {
    @ranges.push([$from, $to]) if $to > $from;
    $from = $to = $next;
  }
}

@ranges.push([$from, $to]) if $to > $from;

say @ranges.raku;
