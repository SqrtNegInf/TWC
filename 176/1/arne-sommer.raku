#!/usr/bin/env raku

unit sub MAIN (Int $count where $count > 0 = 1);

my $ptm := (^Inf).grep({ $_.starts-with('1') && $_.&is-pm });

for ^$count -> $index
{
  my $val = $ptm[$index];
  print ", " if $index;
  print $val;
}

say "";

sub is-pm ($number)
{
  my $n  = $number.comb.sort.join;
  my $n2 = ($number * 2).comb.sort.join;
  my $n3 = ($number * 3).comb.sort.join;
  my $n4 = ($number * 4).comb.sort.join;
  my $n5 = ($number * 5).comb.sort.join;
  my $n6 = ($number * 6).comb.sort.join;

  return $n eq $n2 eq $n3 eq $n3 eq $n4 eq $n5 eq $n6;
}
